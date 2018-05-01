function [descI, codeI]=FPLBP(I, varargin)
	% Four-Patch LBP (FPLBP) code-image and descriptor.
	% Originally described in the paper:
	%
	% Lior Wolf, Tal Hassner and Yaniv Taigman, 
	% "Descriptor Based Methods in the Wild,"
	% Faces in Real-Life Images workshop at the European Conference on Computer Vision (ECCV), Oct 2008
	% http://www.openu.ac.il/home/hassner/projects/Patchlbp/WolfHassnerTaigman_ECCVW08.pdf
	% 
	% [descI, codeI]=FPLBP(I)
	% [descI, codeI]=FPLBP(I, 'param', value,...)
	% descI is an s-by-n matrix of FPLBP code histograms, where s is the size of
	% a code histogram in each of the n cells in the grayscale (2D) image I. 
	% A single global descriptor for the image is obtained by descI(:)
	% codeI is the FPLBP code-image. 
	% Optional parameters are: alpha, gridCellX, gridCellY, maxHistVal, r1, r2, S,
	% tau, w. Please see paper for more information on parameter meanings
	% and values. Note: Error will occure is I is not 2D

	%
	% To display codeI, try:
	% figure; imshow(imadjust(codeI,stretchlim(codeI),[]));
	%
	% 
	% Copyright 2008, Lior Wolf and Tal Hassner
	%
	% The SOFTWARE ("FPLBP") is provided "as is", without any
	% guarantee made as to its suitability or fitness for any particular use.  
	% It may contain bugs, so use of this tool is at your own risk. 
	% We take no responsibility for any damage that may unintentionally be caused 
	% through its use.
	%
	% ver 0.1, 22-Oct-2008
	I = double(I);
	[w,r1,r2,S,alpha,tau,gridCellY,gridCellX,maxHistVal]=parseinput(I,varargin);
	patchRadius = floor(w/2);
    [rs,cs] = size(I);
	border = r2+2*patchRadius;


	%% make sample coordinate range (no padding - leave a band of size r2 from
	%% image sides)
	[XXbase,YYbase]=meshgrid(1:size(I,2),1:size(I,1));
	ii = find(XXbase>border & XXbase<size(I,2)-border+1 &...
		YYbase>border & YYbase<size(I,1)-border+1);
	XX = XXbase(ii);
	YY = YYbase(ii);
	XXrep = repmat(XX,[1,S]);
	YYrep = repmat(YY,[1,S]);

	%% big deltas around circle centers
	AnglesBig = linspace(-pi,pi,S+1);
	AnglesBig = AnglesBig(1:end-1);
	YsamplesBig = r2.*sin(AnglesBig); YsamplesBig = YsamplesBig(:)';
	XsamplesBig = r2.*cos(AnglesBig); XsamplesBig = XsamplesBig(:)';

	%% make sample points for large radii circles
	YdeltasBig = repmat(YsamplesBig,[numel(XX),1]);
	XdeltasBig = repmat(XsamplesBig,[numel(XX),1]);
	XXcirclesBig = XXrep+XdeltasBig;
	YYcirclesBig = YYrep+YdeltasBig;
	XXcirclesBig = round(XXcirclesBig); %% round to nearest pixel
	YYcirclesBig = round(YYcirclesBig); %% round to nearest pixel

	%% small deltas around circle centers
	Anglessmall = linspace(-pi,pi,S+1);
	Anglessmall = Anglessmall(1:end-1);
	Ysamplessmall = r1.*sin(Anglessmall); Ysamplessmall = Ysamplessmall(:)';
	Xsamplessmall = r1.*cos(Anglessmall); Xsamplessmall = Xsamplessmall(:)';

	%% make sample points for large radii circles
	Ydeltassmall = repmat(Ysamplessmall,[numel(XX),1]);
	Xdeltassmall = repmat(Xsamplessmall,[numel(XX),1]);
	XXcirclessmall = XXrep+Xdeltassmall;
	YYcirclessmall = YYrep+Ydeltassmall;
	XXcirclessmall = round(XXcirclessmall); %% round to nearest pixel
	YYcirclessmall = round(YYcirclessmall); %% round to nearest pixel

	%% shift big circle wrt small one
	XXcirclesBig = circshift(XXcirclesBig, [0, -alpha]);
	YYcirclesBig = circshift(YYcirclesBig, [0, -alpha]);

	DBig = zeros(size(XXcirclesBig)); %% #points x S
	Dsmall = zeros(size(XXcirclessmall)); %% #points x S
	for ni = 1:S
		%% sample patches on big circles
		indSampleBig = makePatchSampleCoordMatrix(...
			YYcirclesBig(:,ni), XXcirclesBig(:,ni), rs, cs, patchRadius);
		neighborPatchesBig = I(indSampleBig);

		%% sample patches on small circles		
		indSamplesmall = makePatchSampleCoordMatrix(...
			YYcirclessmall(:,ni), XXcirclessmall(:,ni), rs, cs, patchRadius);
		neighborPatchessmall = I(indSamplesmall);

		%% distances between inner ring patchs and outer ring patchs
		D(:,ni) = sum((neighborPatchesBig - neighborPatchessmall).^2, 2);
	end
	Dsub = D(:,1:S/2) - D(:,S/2+1:end);
	Code = Dsub > tau;

	%% build code map
	codeI = uint8(zeros(size(I)));
	for bit=1:(S/2) %% loop over symetric pairs of each center's neighbors
		bitsInds = find(Code(:,bit));
		codeI(ii(bitsInds)) = bitset(codeI(ii(bitsInds)), bit);
	end

	descI = buildDescriptorGrid(codeI, gridCellX, gridCellY, maxHistVal, 0:2^(S/2)-1);
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


function [w,r1,r2,S,alpha,tau,gridCellY,gridCellX,maxHistVal]=parseinput(I,myargs)
	r1=4;
	r2=5;
	S=8;
	w=3;
	alpha=1;
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
        error('something''s wrong with the parameters for FPLBP');
    end
    
end
