#!/bin/echo docker build . -f
# -*- coding: utf-8 -*-

FROM debian:stable
MAINTAINER Philippe Coval (philippe.coval@osg.samsung.com)

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANG ${LC_ALL}

RUN echo "#log: Configuring locales" \
 && apt-get update \
 && apt-get install -y locales \
 && echo "${LC_ALL} UTF-8" | tee /etc/locale.gen \
 && locale-gen ${LC_ALL} \
 && dpkg-reconfigure locales

ENV project kconfig-frontends

RUN echo "#log: Preparing system for ${project}" \
 && apt-get update -y \
 && apt-get install -y \
  bash \
  git \
  make \
  sudo \
 && apt-get clean \
 && sync

ADD . /usr/local/src/kconfig-frontends
WORKDIR /usr/local/src/kconfig-frontends
RUN echo "#log: Preparing system for ${project}" \
 && ./debian/rules \
 && sync
