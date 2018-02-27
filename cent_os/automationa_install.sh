#!/bin/env bash

function update_upgrade {
yum -y -e1 update  
yum -y -e1 upgrade 
}


CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# After vanila installation we must make update
update_upgraderade


# Cleaning  Centos_repo list
cd $CURRENT_DIR
cat CentOS-Base.repo > /etc/yum.repos.d/CentOS-Base.repo
update_upgrade

# Adding extended package repo
yum -y -e1 install http://mirror.itdc.ge/epel/7/`arch`/e/epel-release-7-5.noarch.rpm


# Installing packages
cat packages.txt | xargs yum -y -e1 install

