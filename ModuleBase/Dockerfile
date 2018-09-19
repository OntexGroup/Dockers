# Use an official Python runtime as a parent image
FROM base

LABEL maintainer="Julien Marusi"

ENV WWWHOME /var/www/html

COPY install_composer.sh "$WWWHOME"

RUN apk add su-exec \
	&& cd "$WWWHOME" \
	&& su-exec www-data:www-data ./install_composer.sh

COPY default.conf /etc/nginx/conf.d