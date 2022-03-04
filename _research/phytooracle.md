---
title: "PhytoOracle"
layout: single-portfolio
excerpt: "<img src='/images/IMG_0102.PNG' height='80' width='80' align='center' alt=''>"
collection: research
order_number: 10
# header:
#   og_image: 'IMG_0102.PNG'
---

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/IMG0102_resize.PNG" height='200' width='200'></p>

<center>PhytoOracle | Scalable, Modular Phenomic Data Processing Pipelines</center>

---

PhytoOracle (PO) is a series of modular, scalable phenomics data processing pipelines. Each pipeline is unique to a proximal sensor; PO currently support RGB, thermal, PSII chlorophyll fluoresence, and 3D laser scanner data. PO allows for time-series, multimodal analysis of plant phenomic data, which is currently a bottleneck in the plant science community. 

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/lettuce_data_examples.png"></p>

# 3D Laser Scanner Data

PhytoOracle's 3D laser scanner processing pipeline processes large point clouds into individual plant point clouds. Ground truth height measurements were collected, hereby referred to as manually-extracted height. Manually-extracted and pipeline-extracted height measurements were compared to assess pipeline performance:

<p align="left"><iframe width="1100" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/83.embed"></iframe></p>

**Figure 1** Correlation between manually- and pipeline-extracted height measurements. The line of best fit was determined using the ordinary least-squares (OLS) method.

<p align="left"><iframe width="1100" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/85.embed"></iframe></p>

**Figure 2** Correlation between manually- and pipeline-extracted height measurements by labeler. The line of best fit for each facet column was determined using the ordinary least-squares (OLS) method. The size of each data point represents the range within the field design.