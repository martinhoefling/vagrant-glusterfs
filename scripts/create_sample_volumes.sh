#!/bin/bash -x

gluster peer probe gluster2
gluster peer probe gluster3

gluster peer status

gluster volume create replicated replica 3 gluster1:/storage/replicated gluster2:/storage/replicated gluster3:/storage/replicated
gluster volume create striped stripe 3 gluster1:/storage/striped gluster2:/storage/striped gluster3:/storage/striped

gluster volume start replicated
gluster volume start striped

gluster volume status all
