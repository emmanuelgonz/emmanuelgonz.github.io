---
title: 'PhytoOracle Data Exploration'
date: 2022-03-21
permalink: /posts/2022/03/phytooracle-data-exploration/
author_profile: False
excerpt_separator: <!--more-->
tags:
  - data
  - analytics
  - terminal
  - bash
  - github
  - git 
  - irods
  - cyverse
  - data
  - science
  - computing
  - soft skills
  - linux
---

Explore field scanalyzer data processed with PhytoOracle!
<!--more-->

The field scanalyzer at the University of Arizona Maricopa Agricultural Center is a multimodal phenotyping platform that travels along rails and captures images and point clouds of thousands of plants. These data are processed using [PhytoOracle](https://github.com/phytooracle/automation) distributed processing pipelines. Given the size of raw data, all field scanalyzer data types are processed on the [University of Arizona high performance cluster](https://public.confluence.arizona.edu/display/UAHPC).

<figure>
<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/gantry_wsj.jpg"></p>
<figcaption align = "left"> <b>Figure 1.</b><i> The field scanalyzer is an outdoor plant phenotyping platform at the University of Arizona Maricopa Agricultural Center.</i>
</figcaption>
</figure>

Sensors enclosed within the sensor box include stereo RGB and thermal cameras, a PSII chlorophyll fluorescence imager, and a pair of 3D laser line scanners.

<figure>
<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/iter_3_gantry_field_sensor_box.png"></p>
<figcaption align = "left"> <b>Figure 2.</b><i> (A) The field scanalyzer covers a 1 hectare field. (B) The platform collects RGB, thermal, PSII chlorophyll fluorescence, and 3D laser scanner data. (C) The raw data is sensor dependent, ranging from 5-350 GBs. All sensor data is captured at the full field scale, except for PSII chlorophyll fluorescence which captures data from the center of each agricultural plot. (D) Raw sensor data is temporarily stored on a cache server, where it is programmatically compressed and uploaded onto CyVerse. Compressed data is downloaded, processed, and outputs transferred on the UA high performance clusters.</i>
</figcaption>
</figure>

# Test dataset 
To download our test dataset, [**click here**](https://drive.google.com/uc?export=download&id=1FO6X4ykbzIYGjUHGewagDRQyp88D7p--). This dataset contains RGB, thermal, PSII chlorophyll fluorescence, and 3D line scanner phenotypic trait data. For a full description of the dataset, [**click here**](https://docs.google.com/document/d/1Qr6vR62ms9PukTpHywnTzy7RWcaN0F6VK5qx25XlrtE/edit?usp=sharing). The complete dataset was used to generate all figures below.

## RGB 

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/229.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 3.</b><i> Bounding area time series showing plant development over the growing period. Errors bars represent the 95% CI around the mean. Means represent the phenotypic average of a lettuce type, including all replicates within a treatment.</i>
</figcaption>
</figure>

## 3D laser scanner

<figure>
<p align="left"><iframe width="1000" height="500" frameborder="0" scrolling="no" src="//plotly.com/~emmanuelg1/237.embed?showlink=false"></iframe></p>
<figcaption align = "left"> <b>Figure 4.</b><i> Height time series showing plant development over the growing period. Errors bars represent the 95% CI around the mean. Means represent the phenotypic average of a lettuce type, including all replicates within a treatment.</i>
</figcaption>
</figure>


## Thermal 

## PSII chlorophyll fluorescence

