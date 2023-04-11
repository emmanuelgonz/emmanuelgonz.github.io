#!/bin/bash 

###
# 1. Prepare IROS APT repository
LSB_RELEASE="bionic" #Using bionic repos because focal is not available
sudo wget -qO - https://packages.irods.org/irods-signing-key.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.irods.org/apt/ ${LSB_RELEASE}  main" \
  | sudo tee /etc/apt/sources.list.d/renci-irods.list
sudo apt-get update && sudo apt-get upgrade -y

###
# 2. Install python-urlib3, python-requests and libssl1.0.0
sudo wget -c \
  http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
sudo apt install \
  ./libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
rm -rf \
  ./libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb

###
# 3. Install irods-icommands
sudo apt install -y irods-icommands
