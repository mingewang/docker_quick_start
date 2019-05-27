#sample dockerfile to build apache
FROM debian:8

RUN apt-get -y update && apt-get -y install apache2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_LOG_DIR /var/log/apache2

COPY ./my-site.conf /etc/apache2/sites-available/my-site.conf

RUN /usr/sbin/a2ensite my-site

EXPOSE 80

# VOLUME
# STOPSIGNAL

RUN mkdir -p /mytest
RUN echo "test" > /mytest/test.txt

VOLUME ["/var/www2", "/var/log/apache2", "/mytest", "/mytest2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
