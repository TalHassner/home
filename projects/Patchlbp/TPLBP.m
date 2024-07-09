function [descI, codeI]=TPLBP(I, varargin)
	% Three-Patch LBP (TPLBP) code-image and descriptor.
	% Originally described in the paper:
	%
	% Lior Wolf, Tal Hassner and Yaniv Taigman, 
	% "Descriptor Based Methods in the Wild,"
	% Faces in Real-Life Images workshop at the European Conference on Computer Vision (ECCV), Oct 2008
	% http://www.openu.ac.il/home/hassner/projects/Patchlbp/WolfHassnerTaigman_ECCVW08.pdf
	% 
	% [descI, codeI]=TPLBP(I)
	% [descI, codeI]=TPLBP(I, 'param', value,...)
	% descI is an s-by-n matrix of TPLBP code histograms, where s is the size of
	% a code histogram in each of the n cells in the grayscale (2D) image I. 
	% A single global descriptor for the image is obtained by descI(:)
	% codeI is the TPLBP code-image. 
	% Optional parameters are: alpha, gridCellX, gridCellY, maxHistVal, r, S,
	% tau, w. Please see paper for more information on parameter meanings
	% and values. Note: Error will occure is I is not 2D
	%
	% To display codeI, try:
	% figure; imshow(imadjust(codeI,stretchlim(codeI),[]));
	%
	% 
	% Copyright 2008, Lior Wolf and Tal Hassner
	%
	% The SOFTWARE ("TPLBP") is provided "as is", without any
	% guarantee made as to its suitability or fitness for any particular use.  
	% It may contain bugs, so use of this tool is at your own risk. 
	% We take no responsibility for any damage that may unintentionally be caused 
	% through its use.
	%
	% ver 0.1, 22-Oct-2008
	I = double(I);	
	[w,r,S,alpha,tau,gridCellY,gridCellX,maxHistVal]=parseinput(I,varargin);
	patchRadius = floor(w/2);
    [rs,cs] = size(I);
    border = r+2*patchRadius;


    %% make sample coordinate range (no padding - leave a band of size r from
    %% image ends)
    [XXbase,YYbase]=meshgrid(1:size(I,2),1:size(I,1));
    ii = find(XXbase>border & XXbase<size(I,2)-border+1 & YYbase>border & YYbase<size(I,1)-border+1);
    XX = XXbase(ii);
    YY = YYbase(ii);

    %% sample patch for each circle center
    indSample = makePatchSampleCoordMatrix(YY, XX, rs, cs, patchRadius);
    centerPatches = I(indSample);

    %% deltas around circle center
    Angles = linspace(-pi,pi,S+1);
    Angles = Angles(1:end-1);
    Ysamples = r.*sin(Angles); Ysamples = Ysamples(:)';
    Xsamples = r.*cos(Angles); Xsamples = Xsamples(:)';


    %% make sample points
    Ydeltas = repmat(Ysamples,[numel(XX),1]);
    Xdeltas = repmat(Xsamples,[numel(XX),1]);
    XXrep = repmat(XX,[1,S]);
    YYrep = repmat(YY,[1,S]);
    XXcircles = XXrep+Xdeltas;
    YYcircles = YYrep+Ydeltas;
    XXcircles = round(XXcircles); %% round to nearest pixel because sampling patches
    YYcircles = round(YYcircles); %% round to nearest pixel because sampling patches

    D = zeros(size(XXcircles)); %% #points x S
    for ni = 1:S
        indSample = makePatchSampleCoordMatrix(YYcircles(:,ni), XXcircles(:,ni), rs, cs, patchRadius);
        neighborPatches = I(indSample);

        %% distances between neighbor patchs and central patchs
        D(:,ni) = sum((neighborPatches - centerPatches).^2, 2);
    end

	D2 = circshift(D, [0, -alpha]);
	Dsub = D - D2;
	Code = Dsub > tau;
	codeI = uint8(zeros(size(I)));
	for bit=1:S
		bitsInds = find(Code(:,bit));
		codeI(ii(bitsInds)) = bitset(codeI(ii(bitsInds)), bit);
	end
	descI = buildDescriptorGrid(codeI, gridCellX, gridCellY, maxHistVal, 0:2^(S)-1);
end

function descI = buildDescriptorGrid(codeI, gridCellX, gridCellY, MaxHistVal, valList) %flagHalfSampleRange)
	% Make descriptor for each distinct [gridCellY, gridCellX] block of
	% pixels in code image
	codes = im2col(codeI,[gridCellY, gridCellX],'distinct');
	descI = hist(codes,valList);

	% Normalize and finalize descriptors
	descI = descI ./ repmat(sqrt(sum(descI.^2)), [size(descI,1),1]);
	descI = min(descI, MaxHistVal);
	descI = descI ./ repmat(sqrt(sum(descI.^2)), [size(descI,1),1]);
end

function I = makePatchSampleCoordMatrix(R, C, rs, cs, d)
    ind = sub2ind([rs, cs], R, C);
    ind = ind(:);
    [x,y] = meshgrid(-d:d, -d:d);
    x = x(:); y = y(:);
    offsets = x + y.*rs;
    offsets = offsets(:)';
    r_ind = repmat(ind, 1, numel(offsets));
    r_offsets = repmat(offsets, numel(ind), 1);
    %% Final sample coordinates and offsets matrix
    I = r_ind + r_offsets;        
end

function [w,r,S,alpha,tau,gridCellY,gridCellX,maxHistVal]=parseinput(I,myargs)
	r=2;
	S=8;
	w=3;
	alpha=5;
	tau=0.01; % noise level
	%descriptor parameters
	gridCellY=16; % columns in each cell
	gridCellX=23; % rows in each cell
	maxHistVal=0.2; % trunc histogram at this value

    try
        for ii=1:2:numel(myargs)
            eval([myargs{ii},'=',num2str(myargs{ii+1}(1)),';']);
        end
    catch
        error('something''s wrong with the parameters for TPLBP');
    end
    
end
