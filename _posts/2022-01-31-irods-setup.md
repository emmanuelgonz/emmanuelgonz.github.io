---
title: 'Setting up iRODS'
date: 2022-01-31
permalink: /posts/2022/01/irods-setup/
excerpt_separator: <!--more-->
tags:
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

Learn how to install and use the Integrated Rule-Oriented Data System (iRODS).
<!--more-->
iRODS is open source data management software used by research groups, such as [CyVerse](https://cyverse.org/data-store). This software provides access to data on the terminal, whether that be your local computer or a high performance computer (HPC). Below are the steps to getting iRODS installed on your machine and an example of a data download. 

# iRODS Installation

## macOS users 

1. Download the macOS installer [here](https://cyverse.atlassian.net/wiki/download/attachments/241869823/cyverse-icommands-4.1.9.pkg?version=3&modificationDate=1472820029000&cacheVersion=1&api=v2).
2. Follow the installation steps. 
3. On your terminal, run: 
   
    ```bash
    iinit
    ```

4. Fill in the prompts with:
    
    |Host name|Port #|Username|Zone|Password|
    |:--------------:|:--:|:-------------:|:----:|:--------------:|
    |data.cyverse.org|1247|CyVerse User ID|iplant|CyVerse password|

5. You're now ready to start downloading data!

## Linux & Windows Subsystem for Linux 2 (WSL2) users 

1. Download the iRODS installation shell script and give it executable permissions:

    ```bash
    wget https://raw.githubusercontent.com/emmanuelgonz/emmanuelgonz.github.io/master/files/install_irods.sh 
    ```

    ```
    chmod 755 install_irods.sh
    ```

2. Run the installation script:
   
   ```bash
   sudo ./install_irods.sh
   ```

3. Log in to iRODS:
   
    ```bash
    iinit
    ```

4. Fill in the prompts with:
    
    |Host name|Port #|Username|zone|Password|
    |:--------------:|:--:|:-------------:|:----:|:--------------:|
    |data.cyverse.org|1247|CyVerse User ID|iplant|CyVerse password|

5. You're ready to start downloading some data! 

# iRODS Data Download 
Let's say we want to download some hyperspectral data on the phytooracle CyVerse DataStore. Follow the steps below to do just that: 

1. Open the [CyVerse DataStore website](https://de.cyverse.org/data/ds/iplant/home/shared/phytooracle/season_12_sorghum_soybean_sunflower_tepary_yr_2021/level_0/VNIR?selectedOrder=asc&selectedOrderBy=name&selectedPage=0&selectedRowsPerPage=100)

2. Find the file you'd like to download
    ![](/images/vnir_download.png)

3. To download the highlighted file above, copy the "Path" and run the ```iget``` command. Below is an example: 
    
    ```bash
    iget -KPVT /iplant/home/shared/phytooracle/season_12_sorghum_soybean_sunflower_tepary_yr_2021/level_0/VNIR/VNIR-2021-05-29__12-17-47-496_sunflower.tar.gz
    ```

    ---
    **NOTE**

    Below is an explanation of each flag used above:
     - -K | Verify the checksum
     - -P | Output the progress of the download
     - -V | Verbose
     - -T | Renew socket connection after 10 minutes

    It's recommended to use the -KT flags, as it prevents errors due to internet connectivity. To see a full list of other flags/options, [click here](https://docs.irods.org/master/icommands/user/#iget).

    ---