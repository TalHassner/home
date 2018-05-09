---
layout: archive
title: "Media / Videos"
permalink: /media/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% for post in site.media reversed %}
  {% include archive-single.html %}
{% endfor %}

### [<font color="SkyBlue">Towards Dense Correspondences Between Any Two Images</font>](https://www.youtube.com/watch?v=I_u9t30Qxj4)
Invited speaker at the [<font color="SkyBlue">IDC Israel Vision Day</font>](http://cs.haifa.ac.il/~hagit/VisionDay/visionDay_2014.html), December 2014 [<font color="SkyBlue">Project, Code and Paper</font>]({{ base_path }}/publication/2016_TPAMI)<br/>

