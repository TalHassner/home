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

### Towards Dense Correspondences Between Any Two Images
21-December-2014: Invited speaker at the IDC Israel Vision Day. [Project, Code and Paper]({{ base_path }}/publication/2016_TPAMI)<br/>
<iframe width="560" height="315" src="https://youtu.be/I_u9t30Qxj4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
