#!/bin/bash
sudo dnf update
sudo dnf install dnf-utils
dnf install httpd
systemctl enable httpd
systemctl start httpd

dnf install php php-cli php-mysqlnd
systemctl restart httpd

sudo dnf install mysql-server

sudo mkdir -p /var/www/static

sudo chmod -R 755 /var/www/static
sudo mkdir -p /var/www/dynamic
sudo chmod -R 755 /var/www/dynamic
sudo cp /vagrant/01-demosite-static.html /var/www/static/
sudo cp /vagrant/.htaccess /var/www/static/
sudo chmod -R 644 /var/www/static/.htaccess
sudo cp /vagrant/01-demosite-php.php /var/www/dynamic/
sudo cp /vagrant/.htaccess /var/www/dynamic/
sudo chmod -R 644 /var/www/dynamic/.htaccess
sudo cp /vagrant/static.conf /etc/httpd/sites-available/
sudo cp /vagrant/dynamic.conf /etc/httpd/sites-available/
sudo cp /vagrant/ports.conf /etc/httpd/
sudo a2ensite static.conf
sudo a2ensite dynamic.conf
sudo a2dissite 000-default.conf
sudo a2enmod rewrite
sudo systemctl restart httpd
