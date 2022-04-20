---
title: "FSGANv2: Improved Subject Agnostic Face Swapping and Reenactment"
collection: publications
permalink: /publication/2022_TPAMI
excerpt: '[<font color="SkyBlue"><i>arXiv preprint</i></font>](https://arxiv.org/abs/2202.12972)'
date: 2022-03-01
venue: 'IEEE Transactions on Pattern Analysis and Machine Intelligence'
paperurl: ''
citation: 'Yuval Nirkin, Yosi Keller, Tal Hassner, <i>FSGANv2: Improved Subject Agnostic Face Swapping and Reenactment.</i> IEEE Transactions on Pattern Analysis and Machine Intelligence. Accepted, March 2022'
---

<img src='../projects/FSGAN/fsgan_v2_teaser.jpeg'><br/>


### Abstract
We present Face Swapping GAN (FSGAN) for face swapping and reenactment. Unlike previous work, FSGAN is subject agnostic and can be applied to pairs of faces without requiring training on those faces. To this end, we describe a number of technical contributions. We derive a novel recurrent neural network (RNN)–based approach for face reenactment which adjusts for both pose and expression variations and can be applied to a single image or a video sequence. For video sequences, we introduce continuous interpolation of the face views based on reenactment, Delaunay Triangulation, and barycentric coordinates. Occluded face regions are handled by a face completion network. Finally, we use a face blending network for seamless blending of the two faces while preserving target skin color and lighting conditions. This network uses a novel Poisson blending loss which combines Poisson optimization with perceptual loss. We compare our approach to existing state-of-the-art systems and show our results to be both qualitatively and quantitatively superior. This work describes extensions of the FSGAN method, proposed in an earlier conference version of our work, as well as additional experiments and results.


[arXiv preprint](https://arxiv.org/abs/2202.12972)

[Bibtex](../projects/FSGAN/bibtexPAMI.txt)

[Code](https://github.com/YuvalNirkin/fsgan)
