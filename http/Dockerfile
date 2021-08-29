FROM nginx:latest
MAINTAINER Frank Villaro-Dixon <frank@villaro-dixon.eu>

ARG URL_AUTHORITY
ENV URL_AUTHORITY=${URL_AUTHORITY}
COPY nginx.conf /etc/nginx/conf.d/${URL_AUTHORITY}.conf

ADD 00-set-https-conf.sh /docker-entrypoint.d/00-set-https-conf.sh
RUN chmod +x /docker-entrypoint.d/00-set-https-conf.sh
EXPOSE 80
EXPOSE 443
