# GlusterFS Vagrant test setup

## Overview

This repo contains a vagrant setup of three glusterfs nodes. Each node has:

* GlusterFS installed
* a 1G xfs formatted storage mounted in /storage
* all other hosts in /etc/hosts, rendering gluster1, gluster2, gluster3 reachable from all instances

## Requirements

* Vagrant (tested with 1.7.3)
* VirtualBox
* RAM > 4G

## Gettin' Started

* Starting all instances: ```vagrant up```
* SSH into gluster1: ```vagrant ssh gluster1```
* The setup can be done as root: ```sudo su```
* Set up glusterfs volumes manually or create sample volumes via script: ```/vagrant/scripts/create_sample_volumes.sh```
