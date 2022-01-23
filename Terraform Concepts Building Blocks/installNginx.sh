#!/bin/bash

# Sleep until the instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
sleep 1
done

# Install nginx
apt-get update
apt-get -y install nginx

# Make sure the nginx is installed
service nginx start