#!/bin/bash

if [[ -f /var/www/certbot/nginx.conf ]] ; then
	cp /var/www/certbot/nginx.conf /etc/nginx/conf.d/${URL_AUTHORITY}.conf
else
	apt-get -y update
	apt-get -y install certbot
	apt-get -y install python-certbot-nginx
	certbot --nginx -d $URL_AUTHORITY --non-interactive $CERTBOT_AGREE_FLAG -m $CERTBOT_EMAIL
	cp /etc/nginx/conf.d/${URL_AUTHORITY}.conf /var/www/certbot/nginx.conf
fi

