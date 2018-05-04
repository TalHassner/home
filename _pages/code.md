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

* <img src='https://osnathassner.github.io/talhassner/images/New - Icon.jpg' width='60' height='30'> **[<font color="SkyBlue">Extreme 3D face reconstruction</font>](https://github.com/anhttran/extreme_3d_faces)**<br/>
Deep models and code for estimating detailed 3D face shapes, including facial expressions and viewpoint. This project extends the code used for our [<font color="SkyBlue">CNN3DMM project</font>](https://www.openu.ac.il/home/hassner/projects/CNN3DMM/) from our CVPR'17 paper. The method is described in [this preprint](https://arxiv.org/abs/1712.05083).

* <img src='https://osnathassner.github.io/talhassner/images/New - Icon.jpg' width='60' height='30'> **[<font color="SkyBlue">FaceExpressionNet (ExpNet)</font>](https://github.com/fengju514/Expression-Net)**<br/>
Deep models and code for estimating the expression bases for a 3D face shape directly from image intensities and without the use of facial landmark detectors.

* [<font color="SkyBlue"><b>FacePoseNet</b></font>](https://github.com/fengju514/Face-Pose-Net)<br/>
Deep, direct estimation of 6 degrees of freedom head pose for 2D and 3D face alignment. The Python code also includes fast rendering for new view synthesis of face photos to three poses, including frontalization.

* **[<font color="SkyBlue">Temporal Tessellation</font>](https://github.com/dot27/temporal-tessellation)**<br/>
A Unified Approach for Video Analysis [<font color="SkyBlue">shown</font>](https://arxiv.org/abs/1612.06950) obtain state of the art results in video captioning (LSMDC’16 benchmark), video summarization (SumMe and TVSum benchmarks), and Temporal Action Detection (Thumos2014 benchmark).

* **[<font color="SkyBlue">Face segmentation and face swapping</font>](https://www.openu.ac.il/home/hassner/projects/faceswap/)**<br/>
Code and deep models for face segmentation and swapping of unconstrained images and arbitrarily selected image pairs.

* **[<font color="SkyBlue">Very deep network for regressing 3D morphable face models (3DMM)</font>](https://www.openu.ac.il/home/hassner/projects/CNN3DMM/)**<br/>
A fast, robust and discriminative method for estimating 3DMM parameters.

* **[<font color="SkyBlue">CLATCH: A CUDA port for the LATCH binary descriptor</font>](https://www.openu.ac.il/home/hassner/projects/LATCH/)**<br/>
LATCH Local binary descriptors at breakneck extraction speeds.

* **[<font color="SkyBlue">Face recognition with augmented data</font>](https://www.openu.ac.il/home/hassner/projects/augmented_faces/)**<br/>
Code, trained models and data are in preparation. Please see project page for updates.

* **[<font color="SkyBlue">Convolutional neural network for facial landmark detection</font>](https://www.openu.ac.il/home/hassner/projects/tcnn_landmarks/)**<br/>
Caffe models, code and example usage.

* **[<font color="SkyBlue">Code and trained Convolutional Neural Networks for emotion recognition</font>](https://www.openu.ac.il/home/hassner/projects/cnn_emotions/)** from single face images.

* **[<font color="SkyBlue">GPU-Based Computation of 2D Least Median of Squares</font>](https://github.com/ligaripash/CudaLMS2D)**<br/>
Fast Least Median of Squares as a more robust substitute for 2D Least Squares, implemented on the GPU

* **[<font color="SkyBlue">The LATCH binary descriptor</font>](https://www.openu.ac.il/home/hassner/projects/LATCH/)**<br/>
The Learned Arrangements of Three Patch Codes (LATCH) Local binary descriptor, implemented as part of OpenCV 3.0.

* **[<font color="SkyBlue">Face frontalization for recognition</font>](https://www.openu.ac.il/home/hassner/projects/frontalize/)**<br/>
MATLAB code for synthesizing aggressively aligned, forward facing new views of faces in unconstrained images.

* **[<font color="SkyBlue">Convolutional neural networks for age and gender classification</font>](https://www.openu.ac.il/home/hassner/projects/cnn_agegender/)**<br/>
Used with the [<font color="SkyBlue">Adience</font>](https://www.openu.ac.il/home/hassner/Adience/data.html#agegender) benchmark of unfiltered face images.

* **[<font color="SkyBlue">Scale propagation</font>](https://www.openu.ac.il/home/hassner/projects/scalemaps/)**<br/>
For scale-invariant dense correspondence estimation across images of different scenes (used with, e.g., SIFT-Flow).

* **[<font color="SkyBlue">In-plane alignment of faces</font>](https://www.openu.ac.il/home/hassner/Adience/code.html#inplanealign)**<br/>
A robust face alignment technique which explicitly considers the uncertainties of facial feature detectors.

* **[<font color="SkyBlue">Identification of Larval feeding strikes</font>](https://github.com/EyalShamur/Identification-of-Larval-feeding-strikes)**<br/>
A framework for automated detection of prey acquisition strikes from a long video of foraging larvae.

* **[<font color="SkyBlue">MATLAB 3D Model Renderer</font>](https://www.openu.ac.il/home/hassner/projects/poses/)**<br/>
MATLAB functions for rendering textured 3D models and using them to calibrate (estimate 6DOF pose) of objects appearing in images. See inside for example usage in estimating head pose. Also available is code for our [<font color="SkyBlue">face animation demo</font>](https://github.com/eshtivi/Poses).

* **[<font color="SkyBlue">Motion Interchange Patterns (MIP)</font>](https://www.openu.ac.il/home/hassner/projects/MIP/)**<br/>
Code for computing the MIP video representation for action recognition.

* **[<font color="SkyBlue">Violent Vlows (ViF) descriptor</font>](https://www.openu.ac.il/home/hassner/data/violentflows/)**<br/>
Code for extracting the ViF video representation for violent action detection in videos of crowded scenes.

* **[<font color="SkyBlue">Scale-Less SIFT (SLS) descriptor</font>](https://www.openu.ac.il/home/hassner/projects/siftscales/)**<br/>
Extracts the SLS descriptor on a dense grid, in order to allow for dense correspondences between images with varying scales.

* **[<font color="SkyBlue">Matched Background Similarity (MBGS) and baseline methods</font>](http://www.cs.tau.ac.il/~wolf/ytfaces/)**<br/>
Sources for computing the similarities of faces appearing in videos for face video verification (set-to-set similarities). Includes both our own MBGS as well as baseline methods tested.

* **[<font color="SkyBlue">The One-Shot Similarity (OSS) Kernel</font>](https://www.openu.ac.il/home/hassner/projects/Ossk/)**<br/>
MATLAB code for efficiently computing the OSS similarity kernel.

* **[<font color="SkyBlue">Patch LBP code</font>](https://www.openu.ac.il/home/hassner/projects/Patchlbp/)**<br/>
MATLAB code for computing the Three-Patch LBP (TPLBP) and the Four-Patch LBP (FPLBP) descriptors for face and texture images.
