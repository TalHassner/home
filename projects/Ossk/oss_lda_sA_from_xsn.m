function sA = oss_lda_sA_from_xsn(XSN)
% 	The One-Shot Similarity (OSS) using LDA as the underlying classifier
% 	Preprocess ''negative (foreign) example'' set XSN
% 
% 	Originally described in the paper:
% 
% 	Lior Wolf, Tal Hassner and Yaniv Taigman, 
% 	"The One-Shot Similarity Kernel,"
% 	IEEE International Conference on Computer Vision (ICCV), Sept. 2009
% 	http://www.openu.ac.il/home/hassner/projects/Ossk/WolfHassnerTaigman_ICCV09.pdf
%
%
% 	Input
% 	XSN: Matrix of ''negative (foreign) examples'' (columns)
% 
% 	Output
% 	sA: Struct used later for fast lda computations
%
% 
% 	Usage:
% 	sA = oss_lda_sA_from_xsn(XSN);
% 	Score1 = oss_lda_score(x1,x2,sA);
% 	Score2 = oss_lda_score(x2,x1,sA);
% 	Score = (Score1 + Score2)./2;
% 
% 	Note that this function may take time to compute, and so should be run only once for any set XSN
% 
% 	Please see paper for more information on the One-Shot similarity.
% 
% 	Copyright 2009, Lior Wolf, Tal Hassner, and Yaniv Taigman
% 
%
% 	The SOFTWARE ("oss_lda_sA_from_xsn") is provided "as is", without any
% 	guarantee made as to its suitability or fitness for any particular use.  
% 	It may contain bugs, so use of this tool is at your own risk. 
% 	We take no responsibility for any damage that may unintentionally be caused 
% 	through its use.
% 
% 	ver 0.1, 16-June-2009
 

sA.meanXSN = mean(XSN,2);
fprintf(1,'about to cov..');
Sw = cov(XSN');
fprintf(1,'finish cov\n');
maxeig = eigs(Sw,1);
Sw = Sw + 0.1 * eye(size(Sw))*maxeig;
fprintf(1,'about to invert..');
sA.iSw = inv(Sw);
fprintf(1,'finish invert\n');
sA.sizeXSN = size(XSN,2);

