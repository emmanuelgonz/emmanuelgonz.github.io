---
title: 'Pip install without sudo on HPC clusters'
date: 2022-03-22
permalink: /posts/2022/03/pip-install-no-root/
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

Learn how to pip install Python packages without root access. 
<!--more-->

---

# Introduction 

High performance computer (HPC) clusters are shared resources. As such, sudo/root access is denied to prevent one user from potentially harming the system or deleting data. This does make installing Linux dependencies and/or Python libraries. So how do we get around this? 

# Finding the default Python

When installing Python packages, it is important to know the default Python version. To find your default version, run the following command: 

```bash
which python3
```

Which should produce an output like this:

<p align="center"><img src="https://github.com/emmanuelgonz/emmanuelgonz.github.io/raw/master/images/which_python3.png"></p>

You can check for other Python version by running: 

```bash
ls -ls /usr/bin/python*
```

# Installing Python libraries 

To install packages without sudo/root access, run the following command, making sure to insert your package name:

```bash
/usr/bin/python3 -m pip install <insert package name here> --user
```

For example, if we wanted to install the awesome giotto-tda package, we would run: 

```bash
/usr/bin/python3 -m pip install giotto-tda --user
```

So why does this work? Well notice the ```--user``` flag, this ensures that the package is only installed within your own environment. This allows you to download packages without sudo/root access on HPC systems and servers.