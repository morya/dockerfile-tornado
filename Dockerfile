From ubuntu:14.04

MAINTAINER moryaden@qq.com

RUN echo "" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >>   /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >>   /etc/apt/sources.list

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    python-pip \
    && apt-get autoremove \
    && apt-get clean

RUN mkdir ~/.pip/
ADD pip.conf ~/.pip/
RUN pip install -U "pip"
RUN pip install -U "tornado"
ADD web /web

EXPOSE 8888

ENTRYPOINT ["/usr/bin/python2.7", "/web/w.py"]
