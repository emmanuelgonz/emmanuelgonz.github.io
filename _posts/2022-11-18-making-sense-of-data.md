---
title: 'Using interactive data visualization to make sense of large datasets'
date: 2022-11-16
permalink: /posts/2022/11/making-sense-of-data/
author_profile: False
toc: true
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
---

As sensor technology improves, data volumes grow. We now live in a sea of data collected by our phones, smartwatches, and home assistants like Alexa. Science is not any different, new sensors are enabling the collection of large datasets that can be mined for new scientific discoveries. In plant science, sensor technology is being applied to study how plants grow under drought conditions. 
<!--more-->

---

# Phenomics: A case study in big data

We will be using data collected by the Field Scanalyzer at the University of Arizona Maricopa Agricultural Center. The Field Scanalyzer covers over an hectare of land - capturing data from over 20,000 plants over a growing season. The Field scanalyzer is equipped with stereo RGB and thermal cameras, a PSII chlorophyll fluorescence imager, and a pair of 3D laser scanners (pictured below). 

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/bold_gantry_box.png"></p>

Collectively, these sensors capture 20 terabytes (TBs) in a three-month period, which makes converting these raw data into information a difficult task. Accomplishing extraction of information requires leveraging machine learning, high performance computers, and distributed computing.

<p align="center"><img height=500 src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/file_sizes_swg.png"></p>

These multiple sources of data provide a fine-scale information of plant growth under drought (decreased water) conditions. Today, we will use some of these data to learn interactive visualization using Python!

<p align="center"><img length=500 src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/lettuce_data_examples.png"></p>

# Materials

- Workshop materials
  - [Google Colab notebook](https://colab.research.google.com/drive/1qXUkjBhO-1my5SxuUNoYLsgzh5UCzJop?usp=sharing)
- Further reading
  - [Living in Data: A Citizen's Guide to a Better Information Future by Jer Thorp](https://www.amazon.com/Living-Data-Citizens-Better-Information/dp/0374189900)
  - [Data Science by John D. Kelleher and Brendan Tierney](https://arizona-primo.hosted.exlibrisgroup.com/permalink/f/6ljalh/01UA_ALMA51598298120003843)