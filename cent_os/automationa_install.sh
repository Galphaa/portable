#!/bin/bash


# After vanila installation we must maket update
yum -y update
yum -y upgrade


# Installing packages 

cat packages.txt | xargs yum install 


