#!/bin/bash
echo "************************"
echo "INSTALLING DEPENDENCIES"
echo "************************"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

echo "**************************"
echo "ADDING KEYS FROM KUBE REPO"
echo "**************************"
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "***************************************"
echo "INSTALLING KUBEADM KUBECTL AND KUBELET"
echo "***************************************"
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

echo "***************************"
echo "HOLDING KUBERNETES PACKAGES"
echo "***************************"
sudo apt-mark hold kubelet kubeadm kubectl
