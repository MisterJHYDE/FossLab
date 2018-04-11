#!/bin/bash

# Installing Apache

pacman -S apache

sudo nano /etc/httpd/conf/httpd.conf
# Comment Out The line 
# LoadModule unique_id_module modules/mod_unique_id.so

systemctl enable httpd
systemctl restart httpd

# To view status of apache server
systemctl status httpd

# Installing Maria DB

pacman -S mysql

# Initialising MariaDB Directory
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

systemctl enable mysqld
systemctl start mysqld

# To verify whether MariaDB is running
systemctl status mysqld

# Installing PHP

pacman -S php php-apache

# Configuring apache php module
sudo nano /etc/httpd/conf/httpd.conf

# Comment out the following line
# LoadModule mpm_event_module modules/mod_mpm_event.so

# Add the following lines
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
LoadModule php7_module modules/libphp7.so
AddHandler php7-script php
Include conf/extra/php7_module.conf

systemctl restart httpd.service