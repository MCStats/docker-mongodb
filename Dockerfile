FROM ubuntu
MAINTAINER Tyler Blair <hidendra@mcstats.org>

# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN apt-get update && apt-get -y install git mongodb-org
RUN apt-get -y upgrade

VOLUME /data

#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

CMD ["mongod"]