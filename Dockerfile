FROM debian:8

MAINTAINER Thomas Bilk <thomasbilk@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

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

RUN gem install --no-document --version '< 0.6' mailcatcher

ENV SMTP_PORT 1025
ENV HTTP_PORT 1080

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf
