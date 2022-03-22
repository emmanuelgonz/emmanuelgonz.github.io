---
title: 'PhytoOracle Data Exploration'
date: 2022-03-22
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
<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/gantry_wsj.jpg"></iframe></p>
<figcaption align = "left"> <b>Figure 1.</b><i> The field scanalyzer is an outdoor plant phenotyping platform at the University of Arizona Maricopa Agricultural Center.</i>
</figcaption>
</figure>

Sensors enclosed within the sensor box include stereo RGB and thermal cameras, a PSII chlorophyll fluorescence imager, and a pair of 3D laser line scanners.

<figure>
<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/iter_3_gantry_field_sensor_box.png"></iframe></p>
<figcaption align = "left"> <b>Figure 1.</b><i> (A) The field scanalyzer covers a 1 hectare field. (B) The platform collects RGB, thermal, PSII chlorophyll fluorescence, and 3D laser scanner data. (C) The raw data is sensor dependent, ranging from 5-350 GBs. All sensor data is captured at the full field scale, except for PSII chlorophyll fluorescence which captures data from the center of each agricultural plot. (D) Raw sensor data is temporarily stored on a cache server, where it is programmatically compressed and uploaded onto CyVerse. Compressed data is downloaded, processed, and outputs transferred on the UA high performance clusters.</i>
</figcaption>
</figure>

# Test dataset 
You can access a test dataset [here](https://drive.google.com/uc?export=download&id=1_Xw7vTaI1VPx0D1IRWvKlQHase7Wrd3i). 