#!/bin/bash
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

mysql_uid=$(id -u mysql)
mysql_gid=$(id -g mysql)

chown -R $mysql_uid:$mysql_gid /var/lib/mysql

#if run first time, how do we know?
if [ ! -f /var/lib/mysql/ibdata1 ]; then

    mysql_install_db

    /usr/bin/mysqld_safe &
    sleep 10s

    # create our local db/user, please adjust according to your needs
    mysql -uroot -e "CREATE DATABASE test ; GRANT ALL PRIVILEGES ON test.* TO 'test'@'localhost' IDENTIFIED BY 'test'; FLUSH PRIVILEGES;"

    killall mysqld
    sleep 10s
fi

service mysql restart

sleep 5s

# some framework db migrate
#cd /your_astisan_project_dir
#php artisan migrate

#enable some apache modeul
a2enmod rewrite
service apache2 restart

# if you have supervisor
#service supervisor restart

tail -f /var/log/messages

