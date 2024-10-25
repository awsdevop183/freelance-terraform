#!/bin/bash
apt update -y
apt install nginx -y
echo "Welcome to Terraform Course" > /var/www/html/index.html
