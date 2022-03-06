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

PhytoOracle (PO) is a series of modular, scalable phenomics data processing pipelines; each pipeline is unique to a proximal sensor. Currently, PO support RGB, thermal, PSII chlorophyll fluoresence, and 3D laser scanner data-- allowing for time-series, multimodal analysis of plant phenomic data, which is currently a bottleneck in the plant science community. Although originally developed for processing data collected with the [Field Scanalyzer (also referred to as "the gantry")](https://youtu.be/da2gKRdMeXY).

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/lettuce_data_examples.png"></p>

PhytoOracle's 3D laser scanner processing pipeline processes large point clouds into individual plant point clouds. Ground truth height measurements were collected, hereby referred to as manually-extracted height. Manually-extracted and pipeline-extracted height measurements were compared to assess pipeline performance:

---

# 3D Laser Scanner Data

Acquired 3D laser scanner data is processed using a variety of containers, which result in individual plant point clouds. A variety of measurements are taken from these individual plant point clouds, ranging from hull volume to bounding box volume and persistence entropy to amplitude. Collectively, these measurements allow us to study the morphology and growth patterns of individual plants over the course of a growing season.

<figure>
<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/2020-03-02_Alanis_45_resize.png" width='296' height='274' alt='Individual lettuce plant point cloud' /></p>
<figcaption align="center"> <b>Figure 1.</b><i> Individual plant point cloud (Alanis lettuce variety) cropped using geographic coordinates. The color map represents height of individual points.</i>
</figcaption>
</figure>

## Fresh weight measurements

At the end of the growing season, each plant within a plot was destructively harvested, weighed, and placed in a drying oven. Fresh weights were collected within an hour of harvesting; these values were then used to calculate the average weight per plant by dividing fresh weight by the total number of plants within a plot. 

### Convex hull volume

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/112.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 2.</b><i> Correlation between fresh weight and median pipeline-extracted hull volume.</i>
</figcaption>
</figure>

### Total number of points

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/109.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 3.</b><i> Correlation between fresh weight and median pipeline-extracted total number of points in point clouds.</i>
</figcaption>
</figure>

## Manual image measurements 



### Height

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/83.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 4.</b><i> Correlation between manually- and pipeline-extracted median height measurements.</i>
</figcaption>
</figure>

### Height by labeler

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/85.embed?showlink=false"></iframe></p>
<figcaption align = "left"><b>Figure 5.</b><i> Correlation between manually- and pipeline-extracted median height measurements by labeler. The size of each data point represents the range within the field design.</i>
</figcaption>
</figure>

## Assessing market type differences 

### t-SNE 

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/136.embed?showlink=false"></iframe></p>
<figcaption align = "left"><b>Figure 6.</b><i> Dimensionality reduction using t-SNE. The target was set as market type, and feature variables included all volume and topological data analysis (TDA) pipeline-extracted values from 3D laser scanner data.</i>
</figcaption>
</figure>