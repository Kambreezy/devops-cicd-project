#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
systemctl restart httpd
rm -rf /tmp/webfiles