FROM ubuntu:latest
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN bash -c "apt update; apt install apache2 php8.1 libapache2-mod-php -y; a2enmod php8.1"
COPY ./anikatsu /var/www/html
EXPOSE 80
CMD "service start apache2"

