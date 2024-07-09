% DEMO script for producing dense flow using the Scale-less SIFT (SLS)
% descriptors [1]. The demo will compute flow from im1 (source, or "Left"
% image) to im2 (target, or "Right" image).
%
% Notes: 
%	1. This code uses the vl_sift function included in the vlfeat distribution [3].
%		in extract_scalelessdescs to produce DSIFT descriptors. It MUST be installed and 
%		available on your MATLAB path in order for this demo to work. See
%		README.txt for more information.
%	2. To compute dense correspondences this code uses the SIFT-Flow algorithm available from [2]
%		It MUST be installed and available on your MATLAB path in order for
%		this demo to work. See README.txt for more information.
%	3. This code can be used to reproduce the flow results reported in the paper.
%		For the optimized descriptor (not described in the paper) please see the help for 
%		extract_scalelessdescs
%
%  References:
%   [1] Tal Hassner, Viki Mayzels, and Lihi Zelnik-Manor,
%   "On SIFTs and their Scales",
%   IEEE Conf. on Computer Vision and Pattern Recognition (CVPR),
%   Rhode Island, June 2012
%   http://www.openu.ac.il/home/hassner/projects/siftscales/
%
%   [2] C. Liu, J. Yuen, A. Torralba, J. Sivic, and W. Freeman. "Sift
%   flow: dense correspondence across different scenes." In European
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
%   The SOFTWARE ("extract_scalelessdescs" and "demo") is provided "as is", without any
%   guarantee made as to its suitability or fitness for any particular use.
%   It may contain bugs, so use of this tool is at your own risk.
%   We take no responsibility for any damage that may unintentionally be caused
%   through its use.
%
%   ver 1.1, 11-June-2012
%

addpath vlfeat-0.9.14/toolbox
addpath release
addpath release/mex
vl_setup('quiet');

im_src_name = 'source.jpg';
im_tgt_name = 'target.jpg';

im_src=imread(im_src_name);
im_tgt=imread(im_tgt_name);

% By default this code produces the same descriptors used in the paper. 
% Use 'pcareduced' instead of 'paper' for PCA reduced SIFT descriptors 
% See help extract_scalelessdescs for more options
[desc_src, desc_tgt] = extract_scalelessdescs(im_src, im_tgt, 'paper'); 


% the following functions are a part of the SIFT-Flow distribution
% and are not included in the SLS demo.
SIFTflowpara.alpha=2;
SIFTflowpara.d=40;
SIFTflowpara.gamma=0.005;
SIFTflowpara.nlevels=4;
SIFTflowpara.wsize=5;
SIFTflowpara.topwsize=20;
SIFTflowpara.nIterations=60;
[vx,vy,~] = SIFTflowc2f(desc_src, desc_tgt, SIFTflowpara);

flo(:,:,1)=vx;
flo(:,:,2)=vy;

clrflo = flowToColor(flo);
figure; imshow(clrflo); title('flow');

wrp=warpImage(im2double(im_tgt),vx,vy);

figure; imshow(im_src); title('source');
figure; imshow(im_tgt); title('dest');
figure; imshow(wrp); title('warped');

