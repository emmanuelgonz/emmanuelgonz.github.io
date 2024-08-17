---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
header:
  og_image: "research/IMG0102_resize.PNG"
---

My research has been [published](publications) in journals such as *Frontiers in Plant Science*, *IEEE Transactions on Geoscience and Remote Sensing*, *The Plant Phenome Journal*, and *Journal of Open Source Education*. I have also been featured in media outlets including the *Wall Street Journal* (see video below), [Seed World](https://seedworld.com/how-the-night-sky-helped-emmanuel-gonzalez-love-plant-breeding/), and [CyVerse News](https://cyverse.org/plants-robots-and-other-interesting-things). My [work](research) explores the variation and temporal basis of adaptive traits in crops such as lettuce, sorghum, and cotton using a range of methods including linear mixed models, machine learning, computer vision, distributed computing, container technology, and geospatial analysis. I have [taught](teaching) courses on cyberinfrastructure, computing technologies, applied machine learning, and biotechnology.

<p align='center'><i>Watch me open a Wall Street Journal feature!</i></p>

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/da2gKRdMeXY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

My research falls into two general areas: developing novel tools to improve the study of phenotypes in a high-throughput manner and studying the variation and temporal basis of adaptive traits. Advanced methods such as machine learning, distributed computing, container technology, and computer vision are used throughout my research agenda.

<nbsp>

{% include base_path %}

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}