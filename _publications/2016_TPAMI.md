---
title: "<img src='https://osnathassner.github.io/talhassner/images/Dense Correspondences - Icon.jpg' width='80'> Dense Correspondences across Scenes and Scales"
collection: publications
permalink: /publication/2016_TPAMI
excerpt: '[Download paper here](https://osnathassner.github.io/talhassner/files/TauHassner_TPAMI.pdf)'
date: 2016-06-15
venue: 'IEEE Trans. on Pattern Analysis and Machine Intelligence (TPAMI), 38(5): 875-888 (2016)'
paperurl: ''
citation: 'Moria Tau and Tal Hassner. (2016). &quot;Dense Correspondences across Scenes and Scales.&quot; <i> IEEE Trans. on Pattern Analysis and Machine Intelligence (TPAMI), 38(5): 875-888 (2016)</i>.'
---

Abstract
------
We seek a practical method for establishing dense correspondences between two images with similar content, but possibly
different 3D scenes. One of the challenges in designing such a system is the local scale differences of objects appearing in the
two images. Previous methods often considered only few image pixels; matching only pixels for which stable scales may be reliably
estimated. Recently, others have considered dense correspondences, but with substantial costs associated with generating, storing and
matching scale invariant descriptors. Our work is motivated by the observation that pixels in the image have contexts – the pixels around
them – which may be exploited in order to reliably estimate local scales. We make the following contributions. (i) We show that scales
estimated in sparse interest points may be propagated to neighboring pixels where this information cannot be reliably determined.
Doing so allows scale invariant descriptors to be extracted anywhere in the image. (ii) We explore three means for propagating this
information: using the scales at detected interest points, using the underlying image information to guide scale propagation in each
image separately, and using both images together. Finally, (iii), we provide extensive qualitative and quantitative results, demonstrating
that scale propagation allows for accurate dense correspondences to be obtained even between very different images, with little
computational costs beyond those required by existing methods


[Project and Code](https://www.openu.ac.il/home/hassner/projects/scalemaps/)

[Download paper here](https://osnathassner.github.io/talhassner/files/TauHassner_TPAMI.pdf)
