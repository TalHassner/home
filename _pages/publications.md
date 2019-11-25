---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

## Books
* Tal Hassner and Ce Liu (Eds.), <i>Dense Image Correspondences for Computer Vision</i>, Springer International Publishing, 2016 ([<font color="SkyBlue">Book at Springer</font>](http://www.springer.com/us/book/9783319230474))

## Publications in Journals, Conferences and Workshops
{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}

## Reports
* Cuong V. Nguyen, Alessandro Achille, Michael Lam, Tal Hassner, Vijay, Mahadevan, Stefano Soatto, <i>Toward Understanding Catastrophic Forgetting in Continual Learning</i>, arXiv preprint arXiv:1908.01091, 2 Aug 2019, ([<font color="SkyBlue">arXiv</font>](https://arxiv.org/abs/1908.01091))

* Tal Hassner, Malte Rehbein, Peter A. Stokes, and Lior Wolf, <i>Computation and Palaeography: Potentials and Limits (Dagstuhl Perspectives Workshop 12382)</i>. Dagstuhl Reports 2(9): 184-199 (2012) ([<font color="SkyBlue">info</font>](http://drops.dagstuhl.de/opus/volltexte/2013/3890/), [<font color="SkyBlue">PDF</font>](http://drops.dagstuhl.de/opus/volltexte/2013/3890/pdf/dagrep_v002_i009_p184_s12382.pdf))

* Tal Hassner and Ronen Basri, <i>Single View Depth Estimation from Examples</i>, arXiv preprint arXiv:1304.3915, 14 Apr 2013  ([<font color="SkyBlue">arXiv</font>](http://arxiv.org/abs/1304.3915))

* Ronen Basri, Tal Hassner and Lihi Zelnik-Manor, <i>A General Framework for Approximate Nearest Subspace Search</i>, Technical Report CCIT #699, Department of Electrical Engineering, Technion, June 2008. ([<font color="SkyBlue">PDF</font>]({{ base_path }}/projects/GANS/BHZM_TechReport_2008.pdf)) <br/>
\* Author names in alphabetical order due to equal contribution.

* Tal Hassner, <i>Building 3D Shapes from Parts</i>, Ph.D. Thesis, Faculty of Mathematics and Computer Science, The Weizmann Institute of Science, December, 2006.





---
This material is presented to ensure timely dissemination of scholarly and technical work. Copyright and all rights therein are retained by authors or by other copyright holders. All persons copying this information are expected to adhere to the terms and constraints invoked by each author's copyright. In most cases, these works may not be reposted without the explicit permission of the copyright holder.
