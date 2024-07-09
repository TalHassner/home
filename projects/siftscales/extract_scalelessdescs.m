function [desc1, desc2, pcab] = extract_scalelessdescs(I1, I2, varargin)
% Extract dense Scale-less SIFT (SLS) descriptors [1] for an image pair. These can
% then be used to establish dense correspondences between the images using the
% SIFT-Flow algorithm [2].
%
% Note: This code uses the vl_sift function included in the vlfeat distribution [3].
%
%   [desc1, desc2] = EXTRACT_SCALELESSDESCS(I1, I2) returns scaleless
%       descriptors for m1 x n1 gray-level image I1 and m2 x n2 gray-level image I2 using
%         default options. desc1 will be m1 x n1 x d, desc2 will be m2 x n2 x d, where d
%         is the dimension of the SLS descriptors.
%
%   [desc1, desc2] = EXTRACT_SCALELESSDESCS(I1, I2, opts ...) returns scaleless
%       descriptors for I1 and I2 using the specified options (see below)
%
%   [desc1, desc2, pcab] = EXTRACT_SCALELESSDESCS(I1, I2, ...) returns
%       scaleless descriptors with the pca basis used for the dim reduction
%
%  opts can have the following values:
%   'pcareduced': [default] use PCA reduced SLS parameter set, not described in the paper.
%        This includes PCA dim-reduction of the original SIFT descriptors and a
%        final SLS of 512D for each pixel.
%   'paper': the parameter values used in the paper. This produces SLS descriptors
%        of 8192D for each pixel.
%   sigma: Range of sigma (scale) values to use. Defaults to linspace(0.2,12,20).
%   dim_reduction: dimension reduction of created descriptor. Use 0 to
%       use original descriptor. Defaults to 32, in which case PCA is used to
%        reduce the SIFT descriptors to 32D.
%   dim_reduction_cov: Number of randomly chosen descriptors used to compute PCA reduction.
%       Defaults to 50000.
%   subs_dim: The dimension of the subspace produced at each pixel. Defaults to 10.
%
%  References:
%   [1] Tal Hassner, Viki Mayzels, and Lihi Zelnik-Manor,
%   "On SIFTs and their Scales",
%   IEEE Conf. on Computer Vision and Pattern Recognition (CVPR),
%   Rhode Island, June 2012
%   http://www.openu.ac.il/home/hassner/projects/siftscales/
%
%   [2] C. Liu, J. Yuen, A. Torralba, J. Sivic, and W. Freeman. Sift
%   flow: dense correspondence across different scenes. In European
%   Conf. Comput. Vision, pages 28-42, 2008.
%   http://people.csail.mit.edu/celiu/ECCV2008/
%
%   [3] A. Vedaldi and B. Fulkerson. Vlfeat: An open and portable
%   library of computer vision algorithms. In Proc. int. conf.
%   on Multimedia, pages 1469-1472, 2010.
%   http://www.vlfeat.org/
%
%   [4] Ronen Basri, Tal Hassner, and Lihi Zelnik-Manor, "Approximate Nearest 
%   Subspace Search," IEEE Trans. on Pattern Analysis and Machine Intelligence 
%   (TPAMI), 33(2), Feb. 2011
%
%   Copyright 2012, Tal Hassner, Viki Mayzels, Shay Filosof, and Lihi Zelnik-Manor
%   http://www.openu.ac.il/home/hassner/projects/siftscales/
%
%
%   The SOFTWARE ("extract_scalelessdescs") is provided "as is", without any
%   guarantee made as to its suitability or fitness for any particular use.  
%   It may contain bugs, so use of this tool is at your own risk.
%   We take no responsibility for any damage that may unintentionally be caused
%   through its use.
%
%   ver 1.1, 11-June-2012
%

    opts.sigma = linspace(0.2,12,20);
    opts.dim_reduction = 32;
    opts.dim_reduction_cov = 50000;
    opts.subs_dim = 10;
    
    for i = 1 : 2 : length(varargin)
        switch varargin{i}
            case 'pcareduced'
                fprintf('Using reduced SLS parameter set\n');
                break
            case 'paper'
                fprintf('Using parameters used in CVPR12 paper\n');
                opts.sigma = linspace(0.5,12,20);
                opts.dim_reduction = 0;
                opts.subs_dim = 8;
                break
            case 'sigma'
                if ~isnumeric(varargin{i+1}) || size(varargin{i+1},1) > 1
                    error('bad sigma (try linspace(0.2,12,20))');
                end
                opts.sigma = varargin{i+1};
            case 'dim_reduction'
                if ~isscalar(varargin{i+1}) || ~isnumeric(varargin{i+1}) || varargin{i+1} < 0
                    error('bad dim_reduction (must be non negative)');
                end
                opts.dim_reduction = varargin{i+1};
            case 'dim_reduction_cov'
                if ~isscalar(varargin{i+1}) || ~isnumeric(varargin{i+1}) || varargin{i+1} < 0
                    error('bad dim_reduction_cov (must be non negative)');
                end
                opts.dim_reduction_cov = varargin{i+1};
            case 'subs_dim'
                if ~isscalar(varargin{i+1}) || ~isnumeric(varargin{i+1}) || varargin{i+1} <= 0
                    error('bad subs_dim (must be non negative)');
                end
                opts.subs_dim = varargin{i+1};
            otherwise
                error('unknown option');
        end
    end
    
    gridspacing = 1; %the spacing of the pixels on the regular grid
    %Calculate the maximal padding size according to vl_sift code for sift-descriptors 
    NBP=4; %number of spatial bins while calculating sift-descriptor
    SBP=3*opts.sigma(end); %maximal extension of each spacial bin
    w=SBP*(NBP+1); %the maximal width/height of the window around the pixel, according to sift.cpp code of vl_feat codepackage

    pad_size=ceil(w/2); % padding size for maximal window size
    
    im1=im2double(I1);
    im2=im2double(I2);
    
    im1_padded = padarray(im1, [pad_size pad_size], 'symmetric');
    im2_padded = padarray(im2, [pad_size pad_size], 'symmetric');
    
    [dp_mat1, num_points1, s11, s12] = generate_descriptors(im1_padded, gridspacing, pad_size, opts);
    [dp_mat2, num_points2, s21, s22] = generate_descriptors(im2_padded, gridspacing, pad_size, opts);
    
    [dp_mat1, dp_mat2, pcab] = dim_reduce(dp_mat1, dp_mat2, opts);
    
    if nargout < 3
      clear pcab;
    end
    
    desc1 = sift_subspace_desc(dp_mat1, num_points1, s11, s12, length(opts.sigma), opts.subs_dim);
    desc2 = sift_subspace_desc(dp_mat2, num_points2, s21, s22, length(opts.sigma), opts.subs_dim);
end

function [dp_mat1, dp_mat2, pcab] = dim_reduce(dp_mat1, dp_mat2, opts)
    pcab = [];
    
    if opts.dim_reduction == 0
        return;
    end
    
    total_cols = opts.dim_reduction_cov;
    col_num1 = size(dp_mat1,2);
    col_num2 = size(dp_mat2,2);
    
    if (total_cols > 0) && (col_num1 + col_num2 > total_cols)
        s = RandStream('mt19937ar','Seed',0);

        cols1 = randperm(s, col_num1);
        cols2 = randperm(s, col_num2);

        col_num1 = int32(col_num1*total_cols/(col_num1+col_num2));
        col_num2 = total_cols - col_num1;
    else
        cols1 = 1 : col_num1;
        cols2 = 1 : col_num2;
    end
    
    c = cov([dp_mat1(:,cols1(1:col_num1)) dp_mat2(:,cols2(1:col_num2))]');    
    COEFF = pcacov(c);
    pcab = COEFF(:, 1:opts.dim_reduction);
    
    dp_mat1 = (dp_mat1' * pcab)';
    dp_mat2 = (dp_mat2' * pcab)';
end

function [dp_mat, num_points, s1, s2] = generate_descriptors(I, gridspacing, p_size, opts)
    %preparing coordinates
    s1 = size(I,1); 
    s2 = size(I,2);
    [x,y] = meshgrid(p_size+1:gridspacing:s1-p_size,p_size+1:gridspacing:s2-p_size); %take only the pixels of real image, not the padded part
    s1=size(x,2); s2=size(x,1);
    coord1=[ y(:) x(:)]';
    clear x y
    coord1 = sortrows(coord1')';
    num_points = size(coord1, 2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if size(I,3) > 1
        I = rgb2gray(I);
    end
    I = single(I);

    %calculating descriptors on each coordinate and scale
    num_sigma=length(opts.sigma);
    fprintf('Calculating I sift subspace descriptors \n' );
    coord_all= kron(coord1,ones(1,num_sigma));
    sigma_all=repmat(opts.sigma,1,size(coord1,2));

    fc = [coord_all; sigma_all; zeros(1,length(sigma_all))];
    [f_mat, dp_mat] = vl_sift(I, 'frames', fc);

    dp_mat = double(dp_mat);

    [~, ind] = sortrows(f_mat');
    dp_mat = dp_mat(:,ind);
    clear f_mat

end

function [B_data] = sift_subspace_desc(dp_mat, num_points, s1, s2, num_sigma, subs_dim)

    %Fitting subspaces - for each point one subspace of dimension subs_dim
    dim = size(dp_mat,1);
    num_elements = sum(sum(triu(ones(dim))));

    B_temp=single(zeros(num_elements,num_points));
    %preparing indices to take the upper triangular matrix + the diagonal
    o=triu(ones(dim));
    [i1 i2]=find(o);
    ind=[i1 i2];
    ind=sortrows(ind);
    ind1=(ind(:,1)-1)*dim+ind(:,2);
    for i=1:num_points
        %printing progress of subspace fitting
        if mod(i,1000)==0
            fprintf(' %u', i);
            fprintf('\n');
        end
        if mod(i,1000000)==0
            fprintf('\n');
        end
        dp_i=dp_mat(:,(i-1)*num_sigma+1:(i*num_sigma));
        [B]=construct_basis(dp_i,subs_dim);%subspace for each point of the image
        % The following code maps subspaces to points using the mapping from [4]
        A=B*B';
        b=diag(diag(A));
        c=A-b;
        b1=b/2;
        A=c+b1;
        H=A';
        H=H(:);
        h=H(ind1);
        B_temp(:,i)=h;
    end
    clear B H A b b1 dp_mat fc coord_all sigma_all coord1
    %Organize the subspaces in output matrix [ Image size x subspace vector size]
    b=(B_temp');
    clear B_temp
    c=b(:);
    clear b
    B_data=reshape(c, [s1 s2 num_elements]);

end
      
function [B sub_av eig_val] = construct_basis(X, subs_dim)
    %construct_basis  fits basis to column vectors in matrix X [n x p].
    % The vectors span some p-dimensional (or less if the vectors are linearly dependent) 
    %subspase in n-dimensional space.  The basis is
    %calculated using PCA. Affine subspace. sub_av - the mean of subspace 

    sub_av = [];
    eig_val = [];
    [~,p]=size(X);
    X = double(X)-repmat(mean(X,2),1,p);
    %X = X';
    [B,~,~] = svds(X,subs_dim);
end