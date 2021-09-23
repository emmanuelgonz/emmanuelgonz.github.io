---
title: 'iRODS Crash Course'
date: 2021-09-23
permalink: /posts/2021/09/irods-crash-course/
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

Learn how to use iRODS for your research data management needs. 
<!--more-->
This tutorial will walk you through downloading and uploading data using iRODS.

1. Let's download some files, run: 
   
    ```
    iget -N 0 -PVT /iplant/home/emmanuelgonzalez/acic_2021_tutorials/mavic_mini_2_sorghum.mp4
    ```

2. Did you run into any problems? 
    * I did not share the file with you, that's why you got that error! 


3. Now that I have shared the file with you, run the command again: 
   
    ```
    iget -N 0 -PVT /iplant/home/emmanuelgonzalez/acic_2021_tutorials/mavic_mini_2_sorghum.mp4
    ```

4. To open the folder in which you downloaded the file run the following command depending on your OS:
   
    * macOS 

        ```
        open .
        ```

    * WSL 2

        ```
        explorer.exe .
        ```

    * Linux 

        ```
        xdg-open .
        ```

5. Now upload the file to your CyVerse Data Store, run: 

    ```
    iput -N 0 -PVT mavic_mini_2_sorghum.mp4
    ```

6. Go to the [CyVerse Data Store](http://de.cyverse.org/) and navigate to your home directory. 
   
    ![](/images/cyverse_home.png)

7. You can share a file by logging into the [CyVerse Data Store](http://de.cyverse.org/), clicking on the 3 dots on the far right and clicking "Share."
   
    ![](/images/share_file.png)

8. Share the file with someone present on the Zoom call. 
9. Congratulations, you are now an iRODS expert!
    
    ![](/images/5170563.jpg)