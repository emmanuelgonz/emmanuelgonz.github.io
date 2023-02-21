---
title: 'Leveraging Supervised and Unsupervised Machine Learning to Study Shapes'
date: 2023-02-21
permalink: /posts/2022/11/supervised-unsupervised/
author_profile: False
toc: True
excerpt_separator: <!--more-->
tags:
  - data
  - analytics
  - terminal
  - bash
  - github
  - git 
  - irods
  - pip
  - python
  - hpc
  - high performance computer
  - programming
  - coding
  - cyverse
  - data
  - science
  - computing
  - soft skills
  - linux
  - data visualization
  - interactive visualization
  - phenomics
  - plant science
---

As sensor technology improves, data volumes grow. We now live in a sea of data collected by our phones, smartwatches, and home assistants like Alexa. Science is not any different, new sensors are enabling the collection of large datasets that can be mined for new scientific discoveries. In plant science, sensor technology is being applied to study how plants grow under drought conditions. 
<!--more-->

---

> **_NOTE:_** Access the workshop notebook [here](https://colab.research.google.com/drive/1UiyhLE-TtURV-jmtpjzEcTrn8jNw-iYV?usp=sharing).

# Research

We will be using data collected by the Field Scanalyzer at the University of Arizona Maricopa Agricultural Center. The Field Scanalyzer covers over an hectare of land - capturing data from over 20,000 plants over a growing season. The Field scanalyzer is equipped with stereo RGB and thermal cameras, a PSII chlorophyll fluorescence imager, and a pair of 3D laser scanners (pictured below). 

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/bold_gantry_box.png"></p>

Collectively, these sensors capture 20 terabytes (TBs) in a three-month period, which makes converting these raw data into information a difficult task. Accomplishing extraction of information requires leveraging machine learning, high performance computers, and distributed computing.

<p align="center"><img height=500 src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/file_sizes_swg.png"></p>

These data enable me and other scientists to study how plants respond to drought stress under real-world, field conditions. These data will contribute to efforts aimed at improving the resiliency of plants to drought stress.

# Data

Today we will be working with 3D point cloud data collected by the Field Scanalyzer. These data provide fine-scale resolution on plant shapes. We will: (<i>i</i>) extract TDA shape descriptors, (<i>ii</i>) run PCA on these data, and (<i>iii</i>) classify plants into their respective variety name.

---

# Workshop materials

- [Google Colab notebook](https://colab.research.google.com/drive/1UiyhLE-TtURV-jmtpjzEcTrn8jNw-iYV?usp=sharing)

# Acknowledgements
With special thanks to: 
- Dr. Duke Pauli & lab members
- Dr. Eric Lyons & lab members