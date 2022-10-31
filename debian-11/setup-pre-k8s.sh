#!/bin/bash
echo "*******************"
echo "SETUP BR_NETFILTER"
echo "*******************"
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF
echo "**********************************************"
echo "CONFIGURING BRIDGE IPV6TABLES AND PORT FORWARD"
echo "**********************************************"
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

echo "**************************"
echo "APPLYING CHANGES ON SYSCTL"
echo "**************************"
sudo sysctl --system


