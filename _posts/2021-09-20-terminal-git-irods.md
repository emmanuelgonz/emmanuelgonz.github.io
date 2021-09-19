---
title: 'Terminal, GitHub, and iRODS Essentials'
date: 2021-09-18
permalink: /posts/2021/09/terminal-git-irods/
excerpt_separator: <!--more-->
tags:
  - terminal
  - bash
  - github
  - git 
  - irods
  - cyverse
---

Learn how to leverage the terminal for GitHub version control and iRods data management!
<!--more-->

# Terminal
Your terminal will look and act differently depending on your operating system (OS). Most scientific computing is done on [Linux](https://www.linux.org/), so that will be the focus of this tutorial.


## MacOS & Linux users
You are ready to proceed. Just open your terminal! 

## Windows users
You will need to download and install the Windows Subsystem for Linux 2(WSL 2). Follow the steps below:
1. Open Powershell as Admin and run: 
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
2. Right-click on the Windows Start icon, click on Run, type ```winver```. Confirm that you meet the requirements below.

---
**WSL 2 requirements**

  x64 systems: Version 1903 or higher, with Build 18362 or higher.

  ARM64 systems: Version 2004 or higher, with Build 19041 or higher.

---

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
7. Open the newly installed Ubuntu app, and you should now see a Linux terminal on your screen!

---
**Note**

  The first time you open the Ubuntu app, you will be asked to create a username and password.

---

# GitHub 
You need to set up an SSH key to easily push changes to your repos. 
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

# Data management with iRODS
