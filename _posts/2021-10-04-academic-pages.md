---
title: 'Creating an academic website on GitHub'
date: 2021-10-4
permalink: /posts/2021/10/academic-pages/
excerpt_separator: <!--more-->
tags:
  - webpage
  - academic
  - github
  - git 
  - research
  - science
  - computing
  - soft skills
---

Learn how to create a website to showcase your academic achievements! 
<!--more-->
This tutorial will walk you through setting up an academic website on GitHub. You can add publications, blog posts, and a CV to your website. Share it with people as you network!

# Preparation (reviewed in previous workshop)

1. Fork the [Academic Pages](https://github.com/academicpages/academicpages.github.io) repo.

    ![](/images/fork_repo.png)

2. Rename the repo to your GitHub username:

    ![](/images/rename_repo.png)

3. Click on the green "Code" button and copy the link to clone your own repo.

    ![](/images/clone_repo.png)

4. On your terminal, run:

    ```bash
    git clone <insert link here>
    ```

---

# About page

1. Open your integrated development environment (IDE) and open up the directory containing your cloned repo.

    ![](/images/ide_clone_2.png)

2. Open the ```_pages``` directory and click on the ```about.md``` file.

    ![](/images/about_md.png)

3. Remove all the text under line 9 (highligthed in blue).
   
   ![](/images/edit_about.png)

4. Edit the header information (title, excerpt)

    ![](/images/fill_about.png)

5. You can add an image by placing it in the ```images``` directory. Use the following code to include it in your page: 
   
    ```bash
    <img title="<fill in with caption title>" alt="Alt text" src="images/<fill in with image name>">
    ```

6. Add, commit, and push your changes:
    
    ```
    git add *
    ```

    ```
    git commit -m 'changes to about me'
    ```

    ```
    git push origin
    ```

7. Now, navigate to your website, which is accessible at ```<GitHub username>.github.io```
   
# Publications page 

1. 