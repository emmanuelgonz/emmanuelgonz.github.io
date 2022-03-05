---
title: "PhytoOracle"
# layout: single-portfolio
excerpt: "<img src='/images/research/IMG_0102.PNG' alt=''>"
collection: research
toc: true
order_number: 10
header:
  og_image: 'research/IMG_0102.PNG'
---

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/research/IMG_0102.PNG" height='200' width='200'></p>

<p align="center"><font size="+3"><b>PhytoOracle: Scalable, Modular Phenomic Data Processing Pipelines</b></font></p>

---

PhytoOracle (PO) is a series of modular, scalable phenomics data processing pipelines. Each pipeline is unique to a proximal sensor. PO currently support RGB, thermal, PSII chlorophyll fluoresence, and 3D laser scanner data. PO allows for time-series, multimodal analysis of plant phenomic data, which is currently a bottleneck in the plant science community. 

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/lettuce_data_examples.png"></p>

PhytoOracle's 3D laser scanner processing pipeline processes large point clouds into individual plant point clouds. Ground truth height measurements were collected, hereby referred to as manually-extracted height. Manually-extracted and pipeline-extracted height measurements were compared to assess pipeline performance:

---

# 3D Laser Scanner Data

## Fresh weight measurements

### Convex hull volume

<figure>
<p align="left"><iframe width="900" height="450" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/112.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 1.</b><i> Correlation between fresh weight and median pipeline-extracted hull volume.</i>
</figcaption>
</figure>

### Total number of points

<figure>
<p align="left"><iframe width="900" height="450" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/109.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 1.</b><i> Correlation between fresh weight and median pipeline-extracted number of points in point clouds.</i>
</figcaption>
</figure>

## Manual image measurements 

<figure>
<p align="left"><iframe width="900" height="450" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/83.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 2.</b><i> Correlation between manually- and pipeline-extracted median height measurements.</i>
</figcaption>
</figure>

<figure>
<p align="left"><iframe width="900" height="450" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/85.embed?showlink=false"></iframe></p>
<figcaption align = "left"><b>Figure 3.</b><i> Correlation between manually- and pipeline-extracted median height measurements by labeler. The size of each data point represents the range within the field design.</i>
</figcaption>
</figure>