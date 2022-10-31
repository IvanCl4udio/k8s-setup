#!/bin/bash
echo "************************"
echo "INSTALLING DEPENDENCIES"
echo "************************"
sudo apt install curl gpg -y

export OS=Debian_11
export CRIO_VERSION=1.23
echo "******************************"
echo "SETUP OPENSUSE REPOS FROM CRIO"
echo "******************************"
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /"|sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$CRIO_VERSION/$OS/ /"|sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION.list
curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION/$OS/Release.key | sudo apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | sudo apt-key add -

echo "******************"
echo "UPDATING PACKAGES"
echo "******************"
sudo apt update
sudo apt upgrade -y

echo "****************"
echo "INSTALLING CRIO"
echo "****************"
sudo apt install cri-o cri-o-runc -y
apt show cri-o

echo "***********************************"
echo "ENABLING AND STARTING CRIO SERVICES"
echo "***********************************"
sudo systemctl enable crio.service
sudo systemctl start crio.service
systemctl status crio

echo "*********************"
echo "INSTALLING CRIO TOOLS"
echo "*********************"

sudo apt install cri-tools
sudo crictl info

echo "*********************"
echo "TESTING INSTALLATION" 
echo "*********************"
sudo crictl pull hello-world



