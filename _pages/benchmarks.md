---
layout: archive
title: "Data and Benchmarks"
permalink: /benchmarks/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

* <img src='../images/New - Icon.jpg' width='50'> **[<font color='SkyBlue'>The TextOCR data set</font>](https://textvqa.org/textocr)**<br/>
We offer ~1M high quality word annotations on TextVQA images allowing application of end-to-end reasoning on downstream tasks such as visual question answering or image captioning. Please see [<font color="SkyBlue">our CVPR'21 preprint</font>](https://arxiv.org/abs/2105.05486) for more information.

* <img src='../images/New - Icon.jpg' width='50'> **[<font color='SkyBlue'>6DoF Pose annotations for our img2pose project</font>](https://github.com/vitoralbiero/img2pose)**<br/>
We provide 6DoF face pose annotations for faces in the WIDER FACE data set. These were used for training and evaluating our img2pose: direct 6DoF pose estimation without face detection or landmark localization. For more information [<font color="SkyBlue">please see this arXiv post</font>](https://arxiv.org/abs/2012.07791).

* **[<font color='SkyBlue'>SKU-110K data set and benchmark</font>](https://github.com/eg4000/SKU110K_CVPR19)**<br/>
Dataset for our [<font color='SkyBlue'>CVPR2019 paper</font>](https://talhassner.github.io/home/publication/2019_CVPR), <i>Precise Detection in Densely Packed Scenes</i>. The benchmark measures object detection scenes where images contain many objects, often appearing similar or even identical, positioned in close proximity. The 11,762 images in SKU-110k represent retail environments and average 147.4 bounding box-labeled objects (store shelf items) per image.

* **[<font color='SkyBlue'>LFW3D</font>](../publication/2015_CVPR_1)**<br/>
Frontal facing, strongly aligned [LFW](http://vis-www.cs.umass.edu/lfw/) images generated using our frontalization method.

* **[<font color='SkyBlue'>Unfiltered Faces for Gender and Age Classification</font>]({{ base_path }}/projects/Adience/Adience-data.html)**<br/>
Dataset of face images, labeled for age, gender and identity, acquired by smart-phones and other mobile devices, and uploaded without manual filtering to online image repositories.

* **[<font color='SkyBlue'>Dynamic Point-Cloud Data</font>](../publication/2013_PG)**<br/>
Real scans and synthetic data For foreground / background motion segmentation.

* **[<font color='SkyBlue'>Violent Flows Benchmark</font>]({{ base_path }}/projects/violentflows/index.html)**<br/>
Video benchmark for classification and detection of outbursts of violence in crowded scenes.

* **[<font color='SkyBlue'>Action Similarity Labeling Benchmark (ASLAN)</font>]({{ base_path }}/projects/ASLAN/ASLAN-main.html)**<br/>
Video benchmark for same/not-same classification of pairs of videos presenting human action in captured in the wild (YouTube).

* **[<font color='SkyBlue'>YouTube Faces Benchmark</font>](http://www.cs.tau.ac.il/~wolf/ytfaces/)**<br/>
Video benchmark for same/not-same classification of pairs of videos presenting human faces. Modeled after the LFW benchmark.

* **[<font color='SkyBlue'>LFW-a Data Set</font>]({{ base_path }}/projects/lfwa/index.html)**<br/>
Our own version of the LFW data set, aligned using commercial software.


---
CODE and DATA provided in this website are provided "as is", without any guarantee made as to their suitability or fitness for any particular use. CODE may contain bugs, so use of this tool is at your own risk. We take no responsibility for any damage of any sort that may unintentionally be caused through the use of any of these resources.
