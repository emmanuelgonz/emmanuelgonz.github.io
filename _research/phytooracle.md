---
title: "Scalable, Modular Phenomics Pipelines"
# layout: single-portfolio
excerpt: "<img src='/images/research/IMG_0102.PNG' style="width:100; height:auto;">"
collection: research
author_profile: False
# toc: true
order_number: 1
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

# Field design and irrigation treatments

<figure>

<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/188.embed?showlink=false"></iframe></p>

<figcaption align = "left"> <b>Figure 1.</b><i> Volumetric water content throughout the growing period at depths 10 cm to 90 cm at intervals of 20 cm.</i>
</figcaption>

</figure>


# RGB Data

Raw RGB data is processed using a variety of containers, which results in individual plant detections. After detection of a single plant, phenotypic trait data such as bounding area and geographic location are collected. Over a 3-month growing period, 250 genotypes 

## Time-series

# 3D Laser Scanner Data

Raw 3D laser scanner data is processed using a variety of containers, which result in individual plant point clouds (**Fig. 2**). A variety of measurements are taken from these individual plant point clouds, ranging from hull volume to bounding box volume and persistence entropy to amplitude. Collectively, these measurements allow us to study the morphology and growth patterns of individual plants over the course of a growing season.

<figure>

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/2020-03-02_Alanis_45.png" alt='Individual lettuce point cloud' style="width:50%"></p>

<figcaption align="center"><b>Figure 2.</b><i> Individual plant point cloud (Alanis lettuce variety) cropped using geographic coordinates. The color map represents height of individual points.</i>
</figcaption>

</figure>

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vSqbAArwr3nk3WNMr6tDgkRyOnfuNgcFvEqP2acsWcPjFr23UiiWGJmNoSszjjtUVbGImbiNsyWNMHv/embed?start=true&loop=true&delayms=3000" frameborder="0" width="768" height="585.6666666666667" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Conclusion

### So why does this work matter?

Automated collection of phenotypic trait data using scalable, modular processing code allows plant scientists to model plant growth over time. When combined with genomic data, we can begin to understand the genetic components of stress-adaptive traits. This knowledge can help us develop more drought resilient crops for changing climatic patterns. 

Variety | Early season | Mid season | Late season 
:------:|:------------:|:----------:|:-----------:
Iceberg | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Iceberg_230_early.gif" style="width:100%"> | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Iceberg_230_mid.gif" style="width:100%"> | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Iceberg_230_late.gif" style="width:100%">
Xanadu | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Xanadu_143_early.gif" style="width:100%"> | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Xanadu_143_mid.gif" style="width:100%"> | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Xanadu_143_late.gif" style="width:100%">
Aido | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Aido_38_early.gif" style="width:100%"> | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Aido_38_mid.gif" style="width:100%"> | <img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Aido_38_late.gif" style="width:100%">


### Moving phenomic data to VR

Phenomic data is both visual (images/point clouds) and numerical (extracted phenotypic traits in Excel sheets), allowing for visualizations that can help plant scientists understand plant stress responses (**Vid. 1**). Point clouds can be added to VR environments to share with the general public and research collaborator, enabling future collaboration between scientists and the public. 

<figure>

<p align="center"><iframe width="960" height="540" src="/files/nappn.mp4" type="video/mp4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>

<figcaption align = "center"><b>Video 1.</b><i> Individual plants visualized in a virtual reality (VR) environment alongside numerical time-series data.</i>
</figcaption>

</figure> -->