function score = oss_lda_score(x1,x2,sA)
% 	The One-Shot Similarity (OSS) using LDA as the underlying classifier
% 	Compute 1-sided One-Shot similarity score
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
% 	x1, x2: Two vectors to be compared
% 	sA: Struct obtained by processing 'negative (foreign) example' set in
% 	function oss_lda_sA_from_xsn
% 
% 	Output
% 	score: 1-sided One-Shot similarity score
%
%
% 	Usage:
% 	sA = oss_lda_sA_from_xsn(XSN);
% 	Score1 = oss_lda_score(x1,x2,sA);
% 	Score2 = oss_lda_score(x2,x1,sA);
% 	Score = (Score1 + Score2)./2;
% 
% 	run this function twice, exchanging x1 with x2 to get the second OSS
% 	score and average the two to get a final OSS score.
% 
% 	Please see paper for more information on the One-Shot Similarity.
% 
% 	Copyright 2009, Lior Wolf, Tal Hassner, and Yaniv Taigman
% 
%
% 	The SOFTWARE ("oss_lda_score") is provided "as is", without any
% 	guarantee made as to its suitability or fitness for any particular use.  
% 	It may contain bugs, so use of this tool is at your own risk. 
% 	We take no responsibility for any damage that may unintentionally be caused 
% 	through its use.
% 
% 	ver 0.1, 16-June-2009

mm = x1 - sA.meanXSN;
v = sA.iSw*mm;
v = v./norm(v);
v0 = v'*(x1+sA.meanXSN)/2;
score = v'*x2-v0;