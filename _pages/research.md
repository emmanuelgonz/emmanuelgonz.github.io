---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
---

My research falls into two main areas: studying the variation and temporal basis of stress-adaptive traits and developing new tools to improve the study of phenotypes in a high-throughput manner. One strand of research in this first area explores how drought stress affects morphological and physiological phenotypes. My interest in geographic information systems (GIS) also informs projects on interesting spatial trends, allowing us to identify differences that may elucidate genetic loci contributing to stress-adaptive traits.

My other main research agenda uses advanced methods to develop new phenotyping approaches that leverage machine learning, distributed computing, container technology, and computer vision. One project uses convolutional neural networks to identify plants and collect individual plant coordinates. These coordinates are then used throughout processing pipelines, allowing us to track individual plants througout multi-modal, time-series data sets. In others, I apply semantic segmentation techniques to terabytes of point cloud data to segment plant organs for deep phenotype extraction. These methods provide multi-modal, time-series phenomic datasets at the plant-level, which is of great interest to the plant science community.

In a new avenue of research, I leverage distributed computing to process terabytes of hyperspectral data to explore disease detection, water content, and pigment quantification. These data provide further phsyiological data, from which variation can be identified and exploited for crop improvement.

<nbsp>

{% include base_path %}

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}