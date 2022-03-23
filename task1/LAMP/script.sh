#!/bin/bash

sudo dnf update
sudo dnf install dnf-utils

#install Apache

sudo dnf install httpd httpd-tools -y
sudo systemctl enable httpd
sudo systemctl start httpd


#install php

sudo dnf install -y dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm 
sudo dnf module reset php
sudo dnf module enable php:remi-7.4
sudo dnf install -y php php-cli php-mysqlnd
dnf install php-gd php-zip php-mcrypt php-json php-xml php-gettext php-curl php-intl 


#install MySQL

sudo dnf -y install @mysql
sudo systemctl enable mysqld.service
sudo systemctl start mysqld.service


sudo systemctl restart httpd
