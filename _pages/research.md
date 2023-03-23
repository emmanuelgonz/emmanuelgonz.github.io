---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
header:
  og_image: "research/IMG0102_resize.PNG"
---

My research falls into two general areas: developing novel tools to improve the study of phenotypes in a high-throughput manner and studying the variation and temporal basis of adaptive traits. Advanced methods such as machine learning, distributed computing, container technology, and computer vision are used throughout my research agenda.

<nbsp>

{% include base_path %}

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}