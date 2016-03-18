FROM answ.me:5000/aplusplus/ubuntu:14.04

RUN apt-get update \
 && apt-get install -y apache2 apache2-utils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && a2enmod ssl dav_fs \
 && rm /etc/apache2/sites-enabled/* \
 && chown -R www-data /var/www \
 && sed -i 's/.*LANG.*//g' /etc/apache2/envvars \
 && echo "" >> /etc/apache2/envvars \
 && echo "export LANG='en_US.UTF-8'" >> /etc/apache2/envvars \
 && echo "export LC_ALL='en_US.UTF-8'" >> /etc/apache2/envvars

ADD dav_ssl.conf /etc/apache2/sites-enabled/
ADD run.sh /app/run.sh
RUN chmod 755 /app/run.sh

EXPOSE 443

CMD ["/app/run.sh"]
