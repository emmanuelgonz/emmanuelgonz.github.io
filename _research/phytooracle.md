---
title: "PhytoOracle"
layout: single-portfolio
excerpt: <img src='/images/research/IMG0102_resize.PNG' alt='PhytoOracle logo'>
collection: research
# permalink: /publication/phytooracle
# link: emmanuelgonz.github.io/publication/phytooracle
# order_number: 10
header:
  og_image: 'research/IMG0102_resize.PNG'
---

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/research/IMG_0102.PNG" height='200' width='200'></p>

<p align="center">PhytoOracle: Scalable, Modular Phenomic Data Processing Pipelines</p>


---

PhytoOracle (PO) is a series of modular, scalable phenomics data processing pipelines. Each pipeline is unique to a proximal sensor. PO currently support RGB, thermal, PSII chlorophyll fluoresence, and 3D laser scanner data. PO allows for time-series, multimodal analysis of plant phenomic data, which is currently a bottleneck in the plant science community. 

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/lettuce_data_examples.png"></p>

PhytoOracle's 3D laser scanner processing pipeline processes large point clouds into individual plant point clouds. Ground truth height measurements were collected, hereby referred to as manually-extracted height. Manually-extracted and pipeline-extracted height measurements were compared to assess pipeline performance:

---

# 3D Laser Scanner Data

<figure>
<p align="center"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/83.embed"></iframe></p>
<figcaption align = "center"> <b>Figure 1.</b><i> Correlation between manually- and pipeline-extracted height measurements. The line of best fit was determined using the ordinary least-squares (OLS) method.</i>
</figcaption>
</figure>

<figure>
<p align="center"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/85.embed"></iframe></p>
<figcaption align = "center"><b>Figure 2.</b><i> Correlation between manually- and pipeline-extracted height measurements by labeler. The line of best fit for each facet column was determined using the ordinary least-squares (OLS) method. The size of each data point represents the range within the field design.</i>
</figcaption>
</figure>

---