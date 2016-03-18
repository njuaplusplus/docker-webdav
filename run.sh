#!/bin/bash

chown -R www-data /var/www

tail -F /var/log/apache2/* &
/usr/sbin/apache2ctl -D FOREGROUND
