#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo Needs to run as root. 1>&2
    exit 1
fi

# Use latest stable puppet for hiera
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb -P /tmp
dpkg -i /tmp/puppetlabs-release-precise.deb
apt-get update

apt-get install puppet -y

if [ -d '/home/ubuntu/hieradata' ]; then
    mv /home/ubuntu/hieradata /etc/puppet
else
    mkdir -p /etc/puppet/hieradata
fi
