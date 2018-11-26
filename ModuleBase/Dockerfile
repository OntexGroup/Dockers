# Use an official Python runtime as a parent image
FROM base

LABEL maintainer="Julien Marusi"

ENV WWWHOME /var/www/html

COPY install_composer.sh "$WWWHOME"
COPY default.conf /etc/nginx/conf.d
COPY start.sh /usr/local/bin


RUN apk add su-exec \
	&& apk add yarn \
	&& cd "$WWWHOME" \
	&& su-exec www-data:www-data ./install_composer.sh

CMD ["/usr/local/bin/start.sh"]