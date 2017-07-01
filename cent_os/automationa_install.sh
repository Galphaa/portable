#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# After vanila installation we must make update
yum -y update
yum -y upgrade

# Cleaning  Centos_repo list
cd $CURRENT_DIR 
cat CentOS-Base.repo > /etc/yum.repos.d/CentOS-Base.repo  

# Adding extended package repo
yum -y install http://mirror.itdc.ge/epel/7/`arch`/e/epel-release-7-5.noarch.rpm


# Installing packages 
cat packages.txt | xargs yum -y install 



