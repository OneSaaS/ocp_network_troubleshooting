#! /bin/bash

# This script uses the crictl command to do an inspection of a container and returns a list of the name of the container and the net na
mespace that it is in.  This can be useful if you want to run a tcpdump on a container

echo "ContainerName ----- KernelNameSpace ----- OVS Port"
# First let's get a list of all containers running on node that are in a running state and loop through it to get relevant information
for containerid in `crictl ps -a|grep Running|awk '{print $1}'`; do
ContainerName=`crictl ps -a|grep $containerid|awk '{print $7}'`;
KernelNameSpace=`crictl inspect $containerid|grep netns|awk -F "/" '{print $5}'|awk -F "\"" '{print $1}'`;
KernelNameSpaceCount=`crictl inspect $containerid|grep netns|awk -F "/" '{print $5}'|awk -F "\"" '{print $1}'|wc -l`;
OVSPort=`ip link show|grep -B1 $KernelNameSpace|grep ovs-system|awk -F ":" '{print $2}'|awk -F "@" '{print $1}' 2> /dev/null`;
if [ $KernelNameSpaceCount -eq "1" ]; then
echo  $ContainerName ----- $KernelNameSpace ----- $OVSPort;
else
:
fi
done;
