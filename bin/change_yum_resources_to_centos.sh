#!/bin/bash

#Program: change_yum_resources_to_centos.sh
#    This shell is used to change the redhat yum repo to centos repo
#
#Pre-Requirements: ( You can find ALL OF THE RESOURCE from : ../resource/ )
#    <1> common system requirements
#    <2> python-iniparse yum-metadata-parser yum yum-plugin-fastestmirror
#
#History:
#    <1> 2013/12/16    created by @StevenGe    0.0.1-SNAPSHOT
#
# Note: Please pay attention to the kernel version between centos and redhat
#       CentOS-5 <===> Redhat-5
#       CentOS-6 <===> Redhat-6

# Step-1: Delete the current yum package
rpm -aq | grep yum|xargs rpm -e --nodeps

# Step-2: Download the latest yum installation packages
cd ../resource/
# python-iniparse
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/python-iniparse-0.3.1-2.1.el6.noarch.rpm
# yum-metadata-parser
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/yum-metadata-parser-1.1.2-16.el6.x86_64.rpm
# yum
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/yum-3.2.29-40.el6.centos.noarch.rpm
# yum-plugin-fastestmirror
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.30-14.el6.noarch.rpm

# Step-3: Install the yum and other packages
# Note: The last two packages must be installed together, cuz they depend on each other
rpm -ivh python-iniparse-0.3.1-2.1.el6.noarch.rpm
rpm -ivh yum-metadata-parser-1.1.2-16.el6.x86_64.rpm
rpm -ivh yum-3.2.29-40.el6.centos.noarch.rpm yum-plugin-fastestmirror-1.1.30-14.el6.noarch.rpm

# Step-4: change the yum repo, we use the neteast repo
cd /etc/yum.repos.d/
rm -rf *

# Step-5: clean the yum cache
yum clean all
yum makecache

# Step-6: exit this bash
exit 0
