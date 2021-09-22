#!/bin/bash 

###
# 1. Prepare IROS APT repository
LSB_RELEASE="bionic" #Using bionic repos because focal is not available
wget -qO - https://packages.irods.org/irods-signing-key.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.irods.org/apt/ ${LSB_RELEASE}  main" \
  | sudo tee /etc/apt/sources.list.d/renci-irods.list
sudo apt-get update

###
# 2. Install python-urlib3, python-requests and libssl1.0.0
wget -c \
  http://security.ubuntu.com/ubuntu/pool/main/p/python-urllib3/python-urllib3_1.22-1ubuntu0.18.04.2_all.deb \
  http://security.ubuntu.com/ubuntu/pool/main/r/requests/python-requests_2.18.4-2ubuntu0.1_all.deb \
  http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb
sudo apt install \
  ./python-urllib3_1.22-1ubuntu0.18.04.2_all.deb \
  ./python-requests_2.18.4-2ubuntu0.1_all.deb \
  ./libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb
rm -rf \
  ./python-urllib3_1.22-1ubuntu0.18.04.2_all.deb \
  ./python-requests_2.18.4-2ubuntu0.1_all.deb \
  ./libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb

###
# 3. Install irods-icommands
sudo apt install -y irods-icommands
