
----------------------- ASLAN data base and benchmark --------------------

https://www.openu.ac.il/home/hassner/data/ASLAN/

The ASLAN database and benchmark were assembled during 2010-11 by Orit Kliper-Gross, Tal Hassner, and Lior Wolf. 
For further details on the database, benchmark and baseline experiments please refer to the following paper:

Orit Kliper-Gross, Tal Hassner, and Lior Wolf
The Action Similarity Labeling Challenge.
IEEE Transactions on Pattern Analysis and Machine Intelligence, 34(3), March 2012.

In this ReadMe file we specify the details of the files available for download on the ASLAN webpage:

=================
ASLAN Video files
=================

The ASLAN_MP4 and ASLAN_AVI zip folders contain 3697 action samples.
"An action sample" is defined as a sub-sequence of a shot presenting a detected action, 
that is, a consecutive set of frames taken by the same camera presenting one action. 

The action samples are named as follows:
[ignore]- four digit id of the sample (from 0001 to 3697).

The details on each sample is given in the file "ASLAN_Samples_List.txt" under "Additional Information" (see below).


=========
Benchmark
=========

The ASLAN benchmark focuses on a same/not-same test. 
The goal is to decide if two video samples present the same action or not, 
following training with same and not-same labeled pairs of video samples. 
The actions in the test set are not observed during training, but rather include actions from separate classes. 

-----------------------------
View1 (algorithm development)
-----------------------------
includes two .mat files 
train_pairs.mat: 600 "same"-labled pairs and 600 "not-same"-labeled pairs (total of 1200 pairs)
test_pairs.mat: 300 "same"-labled pairs and 300 "not-same"-labeled pairs  (total of 600 pairs)

Format:
The mat file is a 1200 (or 600) x 5 matrix,
where each row is a pair, and each column contains the following pair information:

The id of the first sample
The id of the second sample
The pair label (0/1)
The action label of the first sample
The action label of the second sample


The ids of the samples relate to the naming convension of the files in the database video files download above.
The labels of the actions are given in the file "Actions_List.txt" under "Additional information" (see below).

------------------------------
View2 (reporting performances)
------------------------------
includes View2.mat file of the splits, which is  600 x 5 x 10 matrix (named 'action_splits_pairs').

600 pairs of each split (300 "same"-pairs, 300 "not-same" pairs).
5 numbers (as in View1 above) indicating the information on each pair.
10 for each of the 10 splits.


======================
Additional Information
======================

Includes the following text files of database information:


--------------------
Samples Information:
--------------------

Samples_Details.txt
-------------------

This is a list of 3697 lines. 
Each line contains the following information about a specific action sample:
(the delimiter is specified after each description)

The sample id (also the number of the line)
[tab space]
The action asigned to this action sample 
\
The keyword used for youtube search
-
The URL id in YouTube
-
The title of the original video in YouTube
-
The action sample start within the original YouTube video (seconds)
-
The duration of the action sample (seconds)


The URL id relates to the ID inside the URL address in YouTube,
and enable watching the original video from which the sample was taken.
(see "URL_list.txt" below for additional details).


Num_Samples_Per_Action.txt 
--------------------------
This is a list of actions sorted by the number of samples in each.

each line is as follows:

The number of samples [tab space] The name of the action.


and Num_Samples_Per_URL.txt
---------------------------
This is a list of URL ids sorted by the number of samples in each.

The number of samples [tab space] The URL id.



--------------------
Actions Information:
--------------------

Actions_Ids.txt
---------------

This is a list of 432 lines.
A line for each action includes:

The action id (also the number of the line)
The action label 


Action_Hierarchy.txt
--------------------

This is a list of 432 lines, a line for each final action label.
This hierarchy is based on the CMU motion capture database (See: http://mocap.cs.cmu.edu/), and was used during the database creation. 


-----------------
URLs Information:
-----------------

URL_List.txt
------------

The list of 1571 URLs of the YouTube videos participate in this database.
each URL has the following form:
http://www.youtube.com/watch?v=[URL id]
where the URL id of each action sample is given in the "ASLAN_Samples_List.txt" (see above).  


Num_URLs_Per_Action.txt 
-----------------------
This is a list of actions sorted by the number of URLs used in each.

each line is as follows:

The number of URLs [tab space] The name of the action.



===========
Descriptors
===========

Three types of descriptors are given:
HOG (Histograms of Oriented Gradients)
HOF (Histograms of Optical Flow)
HNF (componed of the two)

See: http://www.irisa.fr/vista/Equipe/People/Laptev/download.html#stip
for the code and detailed description of the computed descriptors.
In our implementation we used the stip-1.1-winlinux.zip as is.

We supply the three original computed descriptors - 3 text files for each of the action samples participate in the ASLAN benchmarks.
Note that due to its size the HNF files are given in two parts.

We further supply 3 .mat files (ASLAN_[HOG/HOF/HNF]_pairs.mat - one for each descriptor)
These are the benchmark decsriptors after Bag-of-Words (BOW).
Each .mat file is a 4 dimensional 6000 x 5000 x 2 x 10 matrix, named is STIP_[HOG/HOF/HNF]_pairs_mat respectively.

The dimensions are as follows:
6000 pairs of View2
5000 descriptor dimension after BOW. (i.e. we used k-means with k = 5000 in our BOW implementation) 
2 for each of the action samples in the pair
10 for each split (a different vacabulary was used)

Important Note!
The pairs are organized such that the 600 test pairs of each split appear first, 
followed by 5400 of the current traianaig pairs. 

These matrices were used in our paper for calculating the similarities and distances reported in the paper (Table 3) 
and can be used to recreate the results reported in the paper.


====
Code
====

Evaluation Code:
----------------

.zip folder contains the following 3 .m (matlab) files:

The WYtotable.m is the main function getting:

num_experiments by num_pairs matrix
The pairs labeles
The split ids 

and returns ROC statstics such as: accuarcy, standard error, AUC etc.

The ROCetcMod.m files return a struct including the TP_rate and FP_rate.
These can be saved into text files and used in the ROC generation plot (see the Results tab).

It calls the utility function auc.m to compute the area under curve (AUC).


Bag of Words:
-------------

.zip folder contains 2 .m files: 

read_org_descriptor_files.m
which transform the original descriptors text files into .mat files.

and,
create_pairs_mat_by_BOW.m file 
which is a standard implementation of Bag-of-Words.
We use kmeans (with k=5000) on 100k random STIP points from the training set of each split.
kmean2 code: http://vision.ucsd.edu/~pdollar/toolbox/doc/

To calculate the histograms of words accourence in each video file.
ANN code: http://www.wisdom.weizmann.ac.il/~bagon/matlab.html#ann

See Links and Related DB Tab for links to the above related code.
 

Baseline Tests:
---------------
.zip folder contains the following 6 files:

Run_ASLAN_Baseline_Tests.m
The main function reading the pairs mat of all descriptors and save the results to a directory.

It loads the benchmark descriptors pairs matrices (loadSTIP.m).

Then calls,
calc_sim.m to compute the dis-similarities mentioned in the paper.

Then it calls,
svmtogetrw.m which runs libsvm through the follwoing methods: CLSlibsvm.m CLSlibsvmC.m.
LIBSVM code was downloaded from: http://www.csie.ntu.edu.tw/~cjlin/libsvm/#download 
version libsvm-mat-2.91-1.

Finally, it uses the evaluation code above to compute ROC statistics.

See Links and Related DB Tab for links to the above related code.


-------------------------------------------------------------
If you use any of our data or code please cite the following:
-------------------------------------------------------------

Orit Kliper-Gross, Tal Hassner, and Lior Wolf,
The Action Similarity Labeling Challenge.
IEEE Transactions on Pattern Analysis and Machine Intelligence {TPAMI}, 34(3), March 2012.

BibTex entry:
-------------
@article{KGHW:TPAMI:ASLAN
  author    = {O.~Kliper-Gross and T.~Hassner and L.~Wolf},
  title     = {The Action Similarity Labeling Challenge},
  journal   = {IEEE Transactions on Pattern Analysis and Machine Intelligence {TPAMI}},
  volume    = {34},
  number    = {3},
  pages     = {615--621},
  year      = {2012}
  URL 	    = {https://www.openu.ac.il/home/hassner/data/ASLAN}
}


Questions and comments can be sent to:
--------------------------------------
orit.kliper@weizmann.ac.il
talhasnner@gmail.com
wolf@tau.ac.il

Thank you,
The authors.
