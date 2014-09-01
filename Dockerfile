FROM ubuntu:14.04
MAINTAINER SungKwang Song <saltfactory@gmail.com>

# install nginx
#
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update && apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# mount sites-enabled and log from host directory
#
VOLUME ["/etc/nginx/sites-enabled","/var/log/nginx", "/etc/nginx/cert"]

# set working directory
#
WORKDIR /etc/nginx

# forwarding ports
#
EXPOSE 80
EXPOSE 443

CMD ["nginx"]
