---
layout: archive
title: "Code and Software Tools"
permalink: /code/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

New! Extreme 3D face reconstruction
Deep models and code for estimating detailed 3D face shapes, including facial expressions and viewpoint. This project extends the code used for our CNN3DMM project from our CVPR'17 paper. The method is described in this preprint.

New! FaceExpressionNet (ExpNet)
Deep models and code for estimating the expression bases for a 3D face shape directly from image intensities and without the use of facial landmark detectors.

FacePoseNet
Deep, direct estimation of 6 degrees of freedom head pose for 2D and 3D face alignment. The Python code also includes fast rendering for new view synthesis of face photos to three poses, including frontalization.

Temporal Tessellation
A Unified Approach for Video Analysis shown obtain state of the art results in video captioning (LSMDC’16 benchmark), video 
summarization (SumMe and TVSum benchmarks), and Temporal Action Detection (Thumos2014 benchmark).

Face segmentation and face swapping
Code and deep models for face segmentation and swapping of unconstrained images and arbitrarily selected image pairs.

Very deep network for regressing 3D morphable face models (3DMM)
A fast, robust and discriminative method for estimating 3DMM parameters.

CLATCH: A CUDA port for the LATCH binary descriptor
LATCH Local binary descriptors at breakneck extraction speeds.

Face recognition with augmented data.
Code, trained models and data are in preparation. Please see project page for updates.

Convolutional neural network for facial landmark detection.
Caffe models, code and example usage.

Code and trained Convolutional Neural Networks for emotion recognition from single face images.

GPU-Based Computation of 2D Least Median of Squares
Fast Least Median of Squares as a more robust substitute for 2D Least Squares, implemented on the GPU

The LATCH binary descriptor
The Learned Arrangements of Three Patch Codes (LATCH) Local binary descriptor, implemented as part of OpenCV 3.0.

Face frontalization for recognition
MATLAB code for synthesizing aggressively aligned, forward facing new views of faces in unconstrained images.

Convolutional neural networks for age and gender classification. Used with the  Adience benchmark of unfiltered face images.

Scale propagation
For scale-invariant dense correspondence estimation across images of different scenes (used with, e.g., SIFT-Flow).

In-plane alignment of faces
A robust face alignment technique which explicitly considers the uncertainties of facial feature detectors.

Identification of Larval feeding strikes
A framework for automated detection of prey acquisition strikes from a long video of foraging larvae.

MATLAB 3D Model Renderer
MATLAB functions for rendering textured 3D models and using them to calibrate (estimate 6DOF pose) of objects appearing in images. See inside for example usage in estimating head pose. Also available is code for our face animation demo.

Motion Interchange Patterns (MIP)
Code for computing the MIP video representation for action recognition.

Violent Vlows (ViF) descriptor
Code for extracting the ViF video representation for violent action detection in videos of crowded scenes.

Scale-Less SIFT (SLS) descriptor
Extracts the SLS descriptor on a dense grid, in order to allow for dense correspondences between images with varying scales.

Matched Background Similarity (MBGS) and baseline methods
Sources for computing the similarities of faces appearing in videos for face video verification (set-to-set similarities). Includes both our own MBGS as well as baseline methods tested.

The One-Shot Similarity (OSS) Kernel
MATLAB code for efficiently computing the OSS similarity kernel.

Patch LBP code
MATLAB code for computing the Three-Patch LBP (TPLBP) and the Four-Patch LBP (FPLBP) descriptors for face and texture images.
