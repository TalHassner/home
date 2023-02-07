---
title: "TextStyleBrush: Transfer of Text Aesthetics from a Single Example"
collection: publications
permalink: /publication/2023_TPAMI
excerpt: '[<font color="SkyBlue"><i>arXiv preprint</i></font>](https://arxiv.org/abs/2106.08385)'
date: 2023-01-10
venue: 'IEEE Transactions on Pattern Analysis and Machine Intelligence'
paperurl: ''
citation: 'Praveen Krishnan, Rama Kovvuri, Guan Pang, Boris Vassilev, Tal Hassner, <i>TextStyleBrush: Transfer of Text Aesthetics From a Single Example.</i> IEEE Transactions on Pattern Analysis and Machine Intelligence. Accepted, January 2023.'
---

<img src='../projects/TextStyleBrush/teaser.png'><br/>
<b>Text generation/editing using TextStyleBrush.</b>b> (Top) Detected words highlighted in blue boxes edited by changing their content and shown in the target image. (Bottom) Given the source handwritten word image (left), we generate a target sentence image mimicking the same handwritten style (right).


### Abstract
We present a novel approach for disentangling the content of a text image from all aspects of its appearance. The appearance representation we derive can then be applied to new content, for one-shot transfer of the source style to new content. We learn this disentanglement in a self-supervised manner. Our method processes entire word boxes, without requiring segmentation of text from background, per-character processing, or making assumptions on string lengths. We show results in different text domains which were previously handled by specialized methods, e.g., scene text, handwritten text. To these ends, we make a number of technical contributions: (1) We disentangle the style and content of a textual image into a non-parametric, fixed-dimensional vector. (2) We propose a novel approach inspired by StyleGAN but conditioned over the example style at different resolution and content. (3) We present novel self-supervised training criteria which preserve both source style and target content using a pre-trained font classifier and text recognizer. Finally, (4) we also introduce Imgur5K, a new challenging dataset for handwritten word images. We offer numerous qualitative photo-realistic results of our method. We further show that our method surpasses previous work in quantitative tests on scene text and handwriting datasets, as well as in a user study.





[IEEE](https://www.computer.org/csdl/journal/tp/5555/01/10027471/1Kl01UZBtQc)

[arXiv preprint](https://arxiv.org/abs/2106.08385)

[Meta AI research blog post](https://ai.facebook.com/blog/ai-can-now-emulate-text-style-in-images-in-one-shot-using-just-a-single-word/), with lots of examples! 

[![IMAGE ALT TEXT](http://img.youtube.com/vi/OC0oe1EzQxo/0.jpg)](http://www.youtube.com/watch?v=OC0oe1EzQxo "Aleksa Gordić - The AI Epiphany - Paper Explained")



### BibTex:
{% highlight html %}
{% raw %}
@ARTICLE{Krishnan:2023:TextStyleBrush,
  author={Krishnan, Praveen and Kovvuri, Rama and Pang, Guan and Vassilev, Boris and Hassner, Tal},
  journal={IEEE Transactions on Pattern Analysis and Machine Intelligence},
  title={{TextStyleBrush}: Transfer of Text Aesthetics from a Single Example},
  year={2023},
  URL = {\url{https://talhassner.github.io/home/publication/2023_TPAMI}}
  note = {Accepted}
}
{% endraw %}
{% endhighlight %}