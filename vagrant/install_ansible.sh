#!/bin/bash -ex
yum -y install epel-release
yum -y update
yum -y install ansible
ansible --version