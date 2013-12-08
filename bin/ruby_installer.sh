#!/bin/bash

#Program: ruby_installer.sh
#    This shell is used to install ruby-1.9.3-rc1 from source code
#
#Pre-Requirements: ( You can find ALL OF THE RESOURCE from : ../resource/ )
#    <1> common system requirements
#    <2> libyaml library
#
#History:
#    <1> 2013/12/08    created by @StevenGe    0.0.1-SNAPSHOT
#

# Step-1 : The system will need the appropriate packages to compile and install the
# source code for ruby.
yum -y install make gcc openssl-devel zlib-devel gcc gcc-c++ \
       make autoconf readline-devel curl-devel expat-devel gettext-devel \
       ncurses-devel sqlite3-devel mysql-devel httpd-devel wget which

# Step-2 : compile and install the libyaml libary
cd ../resource
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar -xzvf yaml-0.1.4.tar.gz
cd yaml-0.1.4
./configure --prefix=/usr/local
make && make install

cd ..
rm -rf yaml-0.1.4

# Step-3 : Download, compile and install Ruby-1.9.3
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p484.tar.gz
tar -xzvf ruby-1.9.3-p484.tar.gz
cd ruby-1.9.3-p484
./configure --prefix=/usr/local --disable-install-doc --with-opt-dir=/usr/local/lib
make && make install

cd ..
rm -rf ruby-1.9.3-p484

exit 0
