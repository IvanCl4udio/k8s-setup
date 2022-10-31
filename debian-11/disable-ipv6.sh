#!/bin/bash
echo "**************"
echo "DISABLING IPV6"
echo "**************"
cat <<EOF | sudo tee /etc/sysctl.d/disable-ipv6.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.tun0.disable_ipv6 = 1
EOF

echo "**************************"
echo "APPLYING CHANGES ON SYSCTL"
echo "**************************"
sudo sysctl --system


