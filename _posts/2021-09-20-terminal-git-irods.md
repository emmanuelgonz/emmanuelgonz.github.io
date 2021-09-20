---
title: 'Terminal, GitHub, and iRODS Essentials'
date: 2021-09-20
permalink: /posts/2021/09/terminal-git-irods/
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
---

Learn how to leverage the terminal for GitHub version control and Integrated Rule-Oriented Data System (iRODS) data management!
<!--more-->
This tutorial is split into three parts: 
1. **Part A**: Terminal 
   * Set up a Linux workspace for scientific computing. 
2. **Part B**: GitHub
   * Build a website to share this with employers, network connections, etc. 
3. **Part C**: iRODS
   * Set up iRODS within your terminal and upload/download data.  

# Part A: Terminal

Your terminal will look and act differently depending on your operating system (OS). Most scientific computing is done on [Linux](https://www.linux.org/), so that will be the focus of this tutorial.

## MacOS & Linux users

You are ready to proceed. Just open your terminal! I strongly suggest you pay attention to the Windows Subsystem for Linux 2 (WSL 2) set up, as you may find this useful when you develop for other OS. 

## Windows users

We need to download and install WSL 2. Follow the steps below:

1. Open Powershell as Admin and run:

    ```
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    ```

2. Right-click on the Windows Start icon, click on Run, type ```winver```. Confirm that you meet the requirements below.

    > ***WSL 2 Requirements***
    >
    > x64 systems: Version 1903 or higher, with Build 18362 or higher.
    >
    > ARM64 systems: Version 2004 or higher, with Build 19041 or higher.

3. Enable the Virtual Machine feature by running:

    ```
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    ```

4. Download and install the Linux kernel update by [clicking here](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).
5. Set WSL 2 as your default version by running:

    ```
    wsl --set-default-version 2
    ```

6. Open the [Windows Store](https://aka.ms/wslstore) and download Ubuntu.
7. Open the newly installed Ubuntu app, and you should now see a Linux terminal on your screen! You will be asked to create a username and password.

# Part B: GitHub

## Account Set Up

We need to set up an SSH key to easily push changes to your repos.

1. On your terminal, run and click enter for all prompts:

    ```
    ssh-keygen
    ```

2. Open the file:

    ```
    vim ~/.ssh/id_rsa.pub
    ```

3. Copy the file contents.
4. Open [GitHub](https://github.com/), click on your Profile Picture > Settings > SSH and GPG keys > New SSH Key.
5. Paste the contents of your file which you previously copied into the Key field and add a descriptive title.
6. Click "Add SSH Key"

## Fork & clone a repo

1. Fork the [Academic Pages](https://github.com/academicpages/academicpages.github.io) repo.

    ![](/images/fork_repo.png)

2. Rename the repo to your GitHub username:

    ![](/images/rename_repo.png)

3. Click on the green "Code" button and copy the link to clone your own repo.

    ![](/images/clone_repo.png)

4. On your terminal, run:

    ```
    git clone <insert link here>
    ```

# Part C: iRODS Data Management

## MacOS users 

1. Download the MacOS installer [here](https://cyverse.atlassian.net/wiki/download/attachments/241869823/cyverse-icommands-4.1.9.pkg?version=3&modificationDate=1472820029000&cacheVersion=1&api=v2).
2. Follow the installation steps. 
3. On your terminal, run: 
4. 
    ```
    iinit
    ```

5. Fill in the prompts with:
    
    |Host name|Port #|Username|zone|Password|
    |:--------------:|:--:|:-------------:|:----:|:--------------:|
    |data.cyverse.org|1247|CyVerse User ID|iplant|CyVerse password|

6. You're now ready to start downloading some data! 

## WSL2 & Linux users 

1. Download and install iRODS:

    ```
    apt-get update && apt-get install -y && apt-get install apt-transport-https gcc gnupg htop less libfuse2 libpq-dev libssl1.0 lsb nano nodejs python-requests software-properties-common vim
    ```

    ```
    wget https://files.renci.org/pub/irods/releases/4.1.10/ubuntu14/irods-icommands-4.1.10-ubuntu14-x86_64.deb && apt-get install ./irods-icommands-4.1.10-ubuntu14-x86_64.deb
    ```

2. Log in to iRODS:
   
    ```
    iinit
    ```

3. Fill in the prompts with:
    
    |Host name|Port #|Username|zone|Password|
    |:--------------:|:--:|:-------------:|:----:|:--------------:|
    |data.cyverse.org|1247|CyVerse User ID|iplant|CyVerse password|

4. You're ready to start downloading some data!
