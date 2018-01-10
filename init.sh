#!/bin/bash -v
yum install -y epel-release
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker
echo "<html>Server</html>" > /usr/html/index.html
docker run --name my-nginx2 -v /usr/html:/usr/share/nginx/html:ro -p 80:80 -d nginx
