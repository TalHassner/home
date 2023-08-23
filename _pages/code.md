---
layout: archive
title: "Code and Software Tools from My Projects"
permalink: /code/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}
* <img src='../images/New - Icon.jpg' width='50'> **[<font color="SkyBlue">Reverse Engineering of Generative Models: Inferring Model Hyperparameters from Generated Images</font>](https://github.com/vishal3477/Reverse_Engineering_GMs)**<br/> Estimating the hyperparameters of a generative model from a photo it generated. Official Pytorch implementation, data, and models used in our experiments. For more details, [<font color="SkyBlue">see project page</font>](https://talhassner.github.io/home/publication/2023_TPAMI_2).


* <img src='../images/New - Icon.jpg' width='50'> **[<font color="SkyBlue">Proactive Image Manipulation Detection</font>](https://github.com/vishal3477/proactive_IMD)**<br/> Protect your media from manipulations. Official Pytorch implementation and data release. For more information, [<font color="SkyBlue">please see our CVPR'22 paper</font>](https://talhassner.github.io/home/publication/2022_CVPR_1).


* <img src='../images/New - Icon.jpg' width='50'> **[<font color="SkyBlue">Out-of-Distribution (OOD) Detection</font>](https://github.com/kobybibas/pnml_ood_detection)**<br/> Single layer network add-on which adds OOD detection capabilities. For more information, [<font color="SkyBlue">please see our NuriPS'21 paper</font>](https://arxiv.org/abs/2110.09246).


* **[<font color="SkyBlue">Multiplexer: end-to-end, multilingual OCR</font>](https://github.com/facebookresearch/MultiplexedOCR)**<br/>
Multilingual OCR pipeline, including detection, segmentation, language identification, and character recognition. For more information [<font color="SkyBlue">please see our CVPR'21 paper</font>](https://arxiv.org/abs/2103.15992).


* **[<font color="SkyBlue">HyperSeg - Official PyTorch Implementation</font>](https://github.com/YuvalNirkin/hyperseg)**<br/>
Code for our state-of-the-art, real-time, semantic segmentation method which uses a novel hyper-network approach. For more information [<font color="SkyBlue">please see our CVPR'21 paper</font>](https://arxiv.org/abs/2012.11582).


* **[<font color="SkyBlue">img2pose implementation and data</font>](https://github.com/vitoralbiero/img2pose)**<br/>
State of the art, real-time face detection and 3D alignment by direct 6DoF face pose estimation. No more face detection or facial landmark localization models! For more information [<font color="SkyBlue">please see our CVPR'21 paper</font>](https://arxiv.org/abs/2012.07791). We provide code, models, sample notebooks, pose annotations, and benchmark evaluation scripts.


* **[<font color="SkyBlue">FSGAN - Official PyTorch Implementation</font>](https://github.com/YuvalNirkin/fsgan)**<br/>
Code and models for our subject agnostic face swapping and reenactment method. Please see [<font color="SkyBlue">FSGAN project page</font>](https://talhassner.github.io/home/publication/2019_ICCV_2) for the paper and more details.

* **[<font color="SkyBlue">Network layer for 3D face view generation</font>](https://github.com/iacopomasi/face_specific_augm/tree/master/cow_data_layer)**<br/>
Used for face specific data augmentation: This layer renders novel face views during training, on-line, with minimal additional compute costs and no storage costs required for the augmented face images. The method is described in [<font color="SkyBlue">this paper</font>](../publication/2019_IJCV_2).


* **[<font color="SkyBlue">Extreme 3D Face Reconstruction</font>](https://github.com/anhttran/extreme_3d_faces)**<br/>
Deep models and code for estimating detailed 3D face shapes, including facial expressions and viewpoint. This project extends the code used for our [<font color="SkyBlue">CNN3DMM project</font>](../publication/2017_CVPR) from our CVPR'17 paper. The method is described in [this preprint](https://arxiv.org/abs/1712.05083). Docker also available, for easy install of model and code.

* **[<font color="SkyBlue">FaceExpressionNet (ExpNet)</font>](https://github.com/fengju514/Expression-Net)**<br/>
Deep models and code for estimating the expression bases for a 3D face shape directly from image intensities and without the use of facial landmark detectors.

* [<font color="SkyBlue"><b>FacePoseNet</b></font>](https://github.com/fengju514/Face-Pose-Net)<br/>
Deep, direct estimation of 6 degrees of freedom head pose for 2D and 3D face alignment. The Python code also includes fast rendering for new view synthesis of face photos to three poses, including frontalization. Network updated to ResNet-101 with considerable improvement to accuracy.

* **[<font color="SkyBlue">Temporal Tessellation</font>](https://github.com/dot27/temporal-tessellation)**<br/>
A Unified Approach for Video Analysis [<font color="SkyBlue">shown</font>](https://arxiv.org/abs/1612.06950) obtain state of the art results in video captioning (LSMDC’16 benchmark), video summarization (SumMe and TVSum benchmarks), and Temporal Action Detection (Thumos2014 benchmark).

* **[<font color="SkyBlue">Face Segmentation and Face Swapping</font>](../publication/2018_FG_1)**<br/>
Code and deep models for face segmentation and swapping of unconstrained images and arbitrarily selected image pairs.

* **[<font color="SkyBlue">Very Deep Network for Regressing 3D Morphable Face Models (3DMM)</font>](../publication/2017_CVPR)**<br/>
A fast, robust and discriminative method for estimating 3DMM parameters.

* **[<font color="SkyBlue">CLATCH: A CUDA Port for the LATCH Binary Descriptor</font>](../publication/2016_WACV_2)**<br/>
LATCH Local binary descriptors at breakneck extraction speeds.

* **[<font color="SkyBlue">Face Recognition With Augmented Data</font>](../publication/2016_ECCV_1)**<br/>
Code, trained models and data are in preparation. Please see project page for updates.

* **[<font color="SkyBlue">Convolutional Neural Network for Facial Landmark Detection</font>](../publication/2017_TPAMI_2)**<br/>
Caffe models, code and example usage.

* **[<font color="SkyBlue">Code and trained Convolutional Neural Networks for emotion recognition</font>](../publication/2015_ICMI)** from single face images.

* **[<font color="SkyBlue">GPU-Based Computation of 2D Least Median of Squares</font>](https://github.com/ligaripash/CudaLMS2D)**<br/>
Fast Least Median of Squares as a more robust substitute for 2D Least Squares, implemented on the GPU

* **[<font color="SkyBlue">The LATCH Binary Descriptor</font>](../publication/2016_WACV_2)**<br/>
The Learned Arrangements of Three Patch Codes (LATCH) Local binary descriptor, implemented as part of OpenCV 3.0.

* **[<font color="SkyBlue">Face Frontalization for Recognition</font>](../publication/2015_CVPR_1)**<br/>
MATLAB code for synthesizing aggressively aligned, forward facing new views of faces in unconstrained images.

* **[<font color="SkyBlue">Convolutional Neural Networks for Age and Gender Classification</font>](../publication/2015_CVPR)**<br/>
Used with the [<font color="SkyBlue">Adience</font>]({{ base_path }}/projects/Adience/Adience-data.html#agegender) benchmark of unfiltered face images.

* **[<font color="SkyBlue">Scale Propagation</font>](../publication/2016_TPAMI)**<br/>
For scale-invariant dense correspondence estimation across images of different scenes (used with, e.g., SIFT-Flow).

* **[<font color="SkyBlue">In-Plane Alignment of Faces</font>]({{ base_path }}/projects/Adience/Adience-code.html#inplanealign)**<br/>
A robust face alignment technique which explicitly considers the uncertainties of facial feature detectors.

* **[<font color="SkyBlue">Identification of Larval Feeding Strikes</font>](https://github.com/EyalShamur/Identification-of-Larval-feeding-strikes)**<br/>
A framework for automated detection of prey acquisition strikes from a long video of foraging larvae.

* **[<font color="SkyBlue">MATLAB 3D Model Renderer</font>](../publication/2014_MVAP)**<br/>
MATLAB functions for rendering textured 3D models and using them to calibrate (estimate 6DOF pose) of objects appearing in images. See inside for example usage in estimating head pose. Also available is code for our [<font color="SkyBlue">face animation demo</font>](https://github.com/eshtivi/Poses).

* **[<font color="SkyBlue">Motion Interchange Patterns (MIP)</font>](../publication/2012_ECCV)**<br/>
Code for computing the MIP video representation for action recognition.

* **[<font color="SkyBlue">Violent Vlows (ViF) Descriptor</font>]({{ base_path }}/projects/violentflows/index.html)**<br/>
Code for extracting the ViF video representation for violent action detection in videos of crowded scenes.

* **[<font color="SkyBlue">Scale-Less SIFT (SLS) Descriptor</font>](../publication/2017_TPAMI)**<br/>
Extracts the SLS descriptor on a dense grid, in order to allow for dense correspondences between images with varying scales.

* **[<font color="SkyBlue">Matched Background Similarity (MBGS) and baseline methods</font>](http://www.cs.tau.ac.il/~wolf/ytfaces/)**<br/>
Sources for computing the similarities of faces appearing in videos for face video verification (set-to-set similarities). Includes both our own MBGS as well as baseline methods tested.

* **[<font color="SkyBlue">The One-Shot Similarity (OSS) Kernel</font>](../publication/2009_ICCV)**<br/>
MATLAB code for efficiently computing the OSS similarity kernel.

* **[<font color="SkyBlue">Patch LBP Code</font>](../publication/2008_ECCV)**<br/>
MATLAB code for computing the Three-Patch LBP (TPLBP) and the Four-Patch LBP (FPLBP) descriptors for face and texture images.





---
CODE and DATA provided in this website are provided "as is", without any guarantee made as to their suitability or fitness for any particular use. CODE may contain bugs, so use of this tool is at your own risk. We take no responsibility for any damage of any sort that may unintentionally be caused through the use of any of these resources.
