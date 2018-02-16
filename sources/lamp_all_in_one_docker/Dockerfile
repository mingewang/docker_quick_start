#################################################################################
# Copyright (c) 2018 Min Wang (mingewang@gmail.com)
# All rights reserved.
#
# Redistribution and use of this software in source and binary forms,
# with or without modification, are not permitted without the permssion
# of the author.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#################################################################################

FROM debian:8

ENV DEBIAN_FRONTEND noninteractive   

RUN apt-get -y update && apt-get -y install apache2 libapache2-mod-php5 php5-mysql mysql-server && apt-get clean && rm -rf /var/lib/apt/lists/*

# something you may want for ssh access or your own apache config file
#COPY ./configs/authorized_keys /root/.ssh/authorized_keys
#COPY ./configs/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 744 /docker-entrypoint.sh

ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
