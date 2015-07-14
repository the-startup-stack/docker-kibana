FROM ubuntu:utopic
MAINTAINER Avi Tzuel <avi@avi.io>

ENV KIBANA_USER kibana
ENV KIBANA_PASSWORD kibana
ENV KIBANA_VERSION 4.1.1

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget nginx-full apache2-utils supervisor && apt-get clean

WORKDIR /opt
RUN wget --no-check-certificate -O- https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz | tar xvfz -
RUN mkdir /etc/kibana

ADD ./templates/nginx/kibana /etc/nginx/sites-available/kibana
ADD ./templates/supervisord.conf /etc/supervisor/conf.d/kibana.conf

RUN rm /etc/nginx/sites-enabled/*
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

ADD run.sh ./run.sh
RUN chmod +x ./run.sh
CMD ./run.sh
