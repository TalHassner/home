---
layout: archive
title: "Publications in Journals, Conferences and Workshops"
permalink: /publications/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}

## Books
* Tal Hassner and Ce Liu (Eds.), <i>Dense Image Correspondences for Computer Vision</i>, Springer International Publishing, 2016 ([<font color="SkyBlue">Book at Springer</font>](http://www.springer.com/us/book/9783319230474))

## Reports
* Gil Shapira and Tal Hassner, GPU-Based Computation of 2D Least Median of Squares with Applications to Fast and Robust Line Detection, arXiv preprint arXiv:1510.01041, 5 Oct. 2015 ([<font color="SkyBlue">Code on GitHub</font>](https://github.com/ligaripash/CudaLMS2D), [<font color="SkyBlue">arXiv</font>](http://arxiv.org/pdf/1510.01041.pdf))

* Tal Hassner, Malte Rehbein, Peter A. Stokes, and Lior Wolf, <i>Computation and Palaeography: Potentials and Limits (Dagstuhl Perspectives Workshop 12382)</i>. Dagstuhl Reports 2(9): 184-199 (2012) ([<font color="SkyBlue">info</font>](http://drops.dagstuhl.de/opus/volltexte/2013/3890/), [<font color="SkyBlue">PDF</font>](http://drops.dagstuhl.de/opus/volltexte/2013/3890/pdf/dagrep_v002_i009_p184_s12382.pdf))

* Tal Hassner and Ronen Basri, <i>Single View Depth Estimation from Examples</i>, arXiv preprint arXiv:1304.3915, 14 Apr 2013  ([<font color="SkyBlue">arXiv</font>](http://arxiv.org/abs/1304.3915))

* Ronen Basri, Tal Hassner and Lihi Zelnik-Manor, <i>A General Framework for Approximate Nearest Subspace Search</i>, Technical Report CCIT #699, Department of Electrical Engineering, Technion, June 2008. ([<font color="SkyBlue">PDF</font>]({{ base_path }}/projects/GANS/BHZM_TechReport_2008.pdf)) <br/>
\ * Author names in alphabetical order due to equal contribution.

* Tal Hassner, <i>Building 3D Shapes from Parts</i>, Ph.D. Thesis, Faculty of Mathematics and Computer Science, The Weizmann Institute of Science, December, 2006.

