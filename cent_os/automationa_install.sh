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


# Installing packages
cat packages.txt | xargs yum -y -e1 install

