FROM debian:8

MAINTAINER Thomas Bilk <thomasbilk@gmailc.com>

ENV DEBIAN_FRONTEND noninteractive
EXPOSE 1080
EXPOSE 1025

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
      ruby \
      ruby-dev \
      make \
      cmake \
      gcc \
      g++ \
      libsqlite3-dev \
      supervisor

RUN gem install --no-document mailcatcher

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf
