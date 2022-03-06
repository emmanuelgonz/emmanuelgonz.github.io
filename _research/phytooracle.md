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

Acquired 3D laser scanner data is processed using a variety of containers, which result in individual plant point clouds (**Fig. 1**). A variety of measurements are taken from these individual plant point clouds, ranging from hull volume to bounding box volume and persistence entropy to amplitude. Collectively, these measurements allow us to study the morphology and growth patterns of individual plants over the course of a growing season.

<figure>

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/2020-03-02_Alanis_45.png" alt='Individual lettuce point cloud' style="width:50%"></p>

<figcaption align="center"><b>Figure 1.</b><i> Individual plant point cloud (Alanis lettuce variety) cropped using geographic coordinates. The color map represents height of individual points.</i>
</figcaption>

</figure>

## Fresh weight measurements

At the end of the growing season, each plant within a plot was destructively harvested, weighed, and placed in a drying oven. Fresh weights were collected within an hour of harvesting; these values were then used to calculate the average weight per plant by dividing fresh weight by the total number of plants within a plot (**Figs. 2, 3**). 

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

For a sample of plots, lettuce plants were imaged on top of a measurement mat. Height and width measurements were collected using the ImageJ software (**Fig. 4, 5, 6**). These measurements were compared to pipeline-extracted height and width measurements to assess PO's accuracy. 

<figure>

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/lettuce_screenshot.png" alt='Individual lettuce point cloud' style="width:60%"></p>

<figcaption align="center"><b>Figure 4.</b><i> Individual plants were destructively harvested and imaged. Manual measurements for height and width were collected using the ImageJ software.</i>
</figcaption>

</figure>


### Height

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/83.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 5.</b><i> Correlation between manually- and pipeline-extracted median height measurements.</i>
</figcaption>
</figure>

### Height by labeler

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/85.embed?showlink=false"></iframe></p>
<figcaption align = "left"><b>Figure 6.</b><i> Correlation between manually- and pipeline-extracted median height measurements by labeler. The size of each data point represents the range within the field design.</i>
</figcaption>
</figure>

## Assessing market type differences 

3D laser scanner data is high dimensional, resulting in many phenotypic traits per individual plant. To assess PO's ability to extract meaningful, biologically-relevant information, t-SNE was used to assess market type differences (**Fig. 7**). 

### t-SNE 

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/136.embed?showlink=false"></iframe></p>
<figcaption align = "left"><b>Figure 7.</b><i> Dimensionality reduction using t-SNE. The target was set as market type, and feature variables included all volume and topological data analysis (TDA) pipeline-extracted values from 3D laser scanner data.</i>
</figcaption>
</figure>

## Conclusion

### So why does this work matter?

Automated collection of phenotypic trait data using scalable, modular processing code allows plant scientists to model plant growth over time. When combined with genomic data, we can begin to understand the genetic components of stress-adaptive traits. This knowledge can help us develop more drought resilient crops for changing climatic patterns. 

Variety | Early season | Mid season | Late season 
:------:|:----------- :|:----------:|:-----------:
Iceberg | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Iceberg_230_early.gif" style="width:100%"></p> | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Iceberg_230_mid.gif" style="width:100%"></p> | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Iceberg_230_late.gif" style="width:100%"></p>
Xanadu | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Xanadu_143_early.gif" style="width:100%"></p> | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Xanadu_143_mid.gif" style="width:100%"></p> | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Xanadu_143_late.gif" style="width:100%"></p>
Aido | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Aido_38_early.gif" style="width:100%"></p> | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Aido_38_mid.gif" style="width:100%"></p> | <p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/Aido_38_late.gif" style="width:100%"></p>


### Moving phenomic data to VR

Phenomic data is both visual (images) and numerical (extracted phenotypic traits), allowing for visualizations that can help us understand plant stress responses. Point clouds can be added to VR environments to share with the general public and research collaborators. This can kindle collaboration between scientists and the public. 

