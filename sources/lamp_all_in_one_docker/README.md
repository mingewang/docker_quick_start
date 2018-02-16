= LAMP in one docker

This is demo/sample to run lamp in on docker image

== How to build it

docker build -t lamp .

== how to run it

docker run --rm --publish 9080:80 -v $(pwd)/html:/var/www/html -v $(pwd)/mysql-data:/var/lib/mysql -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) lamp 

# or run it as detach mode, and always restart 
docker run --detach --restart always --publish 9080:80 -v $(pwd)/html:/var/www/html -v $(pwd)/mysql-data:/var/lib/mysql -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) lamp 

You should be able to access it at your host:

http://localhost:9080/


== how to access the console

docker exec -it docker_id bash
