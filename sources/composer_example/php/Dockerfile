#sample dockerfile to build apache
FROM debian:latest

RUN apt-get -y update && apt-get -y install apache2 libapache2-mod-php5 php5-mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
