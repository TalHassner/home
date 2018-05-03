---
title: "SIFTing through Scales"
collection: publications
permalink: /publication/2017_TPAMI
excerpt: '[Download paper here](https://osnathassner.github.io/talhassner/projects/siftscales/HassneretalTPAMI16.pdf)'
date: 2017-07-25
venue: 'IEEE Trans. on Pattern Analysis and Machine Intelligence (TPAMI), 39(7): 1431-1443 (2017)'
paperurl: ''
citation: 'Tal Hassner, Shay Filosof, Viki Mayzels, and Lihi Zelnik-Manor. (2017). &quot;SIFTing through Scales.&quot; <i>IEEE Trans. on Pattern Analysis and Machine Intelligence (TPAMI), 39(7): 1431-1443 (2017)</i>.'
---

<img src='https://osnathassner.github.io/talhassner/images/SIFTs and Scales - Icon.jpg'>

Abstract
------
Scale invariant feature detectors often find stable scales in only a few image pixels. Consequently, methods for feature matching typically choose one of two extreme options: matching a sparse set of scale invariant features, or dense matching using arbitrary scales. In this paper, we turn our attention to the overwhelming majority of pixels, those where stable scales are not found by standard techniques. We ask, is scale-selection necessary for these pixels, when dense, scale-invariant matching is required and if so, how can it be achieved? We make the following contributions: (i) We show that features computed over different scales, even in low-contrast areas, can be different and selecting a single scale, arbitrarily or otherwise, may lead to poor matches when the images have different scales. (ii) We show that representing each pixel as a set of SIFTs, extracted at multiple scales, allows for far better matches than single-scale descriptors, but at a computational price. Finally, (iii) we demonstrate that each such set may be accurately represented by a low-dimensional, linear subspace. A subspace-to-point mapping may further be used to produce a novel descriptor representation, the Scale-Less SIFT (SLS), as an alternative to single-scale descriptors. These claims are verified by quantitative and qualitative tests, demonstrating significant improvements over existing methods. A preliminary version of this work appeared in [1].


[Project and Code](https://osnathassner.github.io/talhassner/publication/2012_CVPR_1)

[Download paper here](https://osnathassner.github.io/talhassner/projects/siftscales/HassneretalTPAMI16.pdf)
