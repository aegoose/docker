
FROM aegoose/centos7

MAINTAINER aegoose "aegoose@126.com"

# RUN hostname app

# RUN yum install -y epel-release gcc-c++ make cronie

# add php source
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# dependency compile libs
# below is other libs auto enabled by php install
# yum -y install libjpeg libpng freetype libmcrypt libxml2 openssl libcurl zlib pcre gd

# below is the libs for compile
# yum -y install libjpeg-devel libpng-devel freetype-devel libmcrypt-devel \
#   libxml2-devel openssl-devel libcurl-devel zlib-devel \
#   pcre-devel ncurses-devel gd-devel

# php56
# RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
# RUN yum list --enablerepo=remi --enablerepo=remi-php56 | grep php
# RUN yum install -y --enablerepo=remi \
#   --enablerepo=remi-php56 php \
#   php-opcache php-devel \
#   php-fpm php-soap php-pecl-redis php-pecl-memcache \
#   php-mbstring php-mcrypt php-mysqlnd \
#   php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof

# php56w
RUN yum install -y php56w php56w-opcache php56w-fpm \
  php56w-gd php56w-mbstring php56w-mcrypt php56w-mysqlnd \
  php56w-pear php56w-pecl-memcached php56w-pecl-redis php56w-soap \
  php56w-tidy php56w-xml
# Dependency extensions
# pphp56w-common:5.6.25  php56w-cli:5.6.25      php56w-pecl-igbinary:1.2.12
# php56w-pdo:5.6.25      php56w-process:5.6.25

# Dependency Installed: apr apr-util centos-logos
# apr:1.4.8           apr-util:1.5.2      centos-logos:70.0.6
# freetype:2.4.11     httpd:2.4.6         httpd-tools:2.4.6
# libX11:1.6.3        libX11-common:1.6.3 libXau:1.0.8
# libXpm:3.5.11       libedit:3.0         libjpeg-turbo:1.2.90
# libmcrypt:2.5.8     libpng:1.5.13       libtidy:0.99.0
# libtool-ltdl:2.4.2  libxcb:1.11
# libxslt:1.1.28      mailcap:2.1.41      systemd-sysv:219
# t1lib:5.1.2         libevent:2.0.21     libmemcached:1.0.16


# install libiconv
RUN cd /root \
  && curl -o libiconv-1.9.2.tar.gz https://mirrors.tuna.tsinghua.edu.cn/gnu/libiconv/libiconv-1.9.2.tar.gz \
  && tar -zxvf libiconv-1.9.2.tar.gz -C ./ \
  && cd /root/libiconv-1.9.2/ \
  && ./configure && make && make install \
  && cd /root && rm -rf libiconv-1.9.2 libiconv-1.9.2.tar.gz

RUN yum -y install libevent \
    nginx redis memcached sphinx \
    python-devel python-pip

# install libevent
# RUN yum --enablerepo=epel -y install libevent
# install redis (only use redis-cli)
# RUN yum --enablerepo=epel -y install redis
# install memcached (only use memcached lib)
#RUN yum -y install memcached

# python plugin install
# 1.python install dependency
# RUN yum -y install python-devel
# dependency: python-devel:2.7.5  python:2.7.5  python-libs:2.7.5
# 2.install pip
# RUN yum -y install python-pip
# RUN curl https://bootstrap.pypa.io/get-pip.py | python
# dependency: python-setuptools:0.9.8   python-backports:1.0   python-backports-ssl_match_hostname:3.4.0.2
# 2.install tools
RUN pip install Twisted redis protobuf supervisor

# install sphinx
# RUN yum -y install sphinx
# dependency: mariadb-libs:5.5.5 postgresql-libs:9.2.15

# COPY ./php/php-fpm.conf /etc/php-fpm.d/www.conf
# COPY ./sphinx/sphinx.conf /etc/sphinx.conf
# COPY ./redis/redis.conf /etc/redis.conf
# COPY ./supervisord/supervisor.conf /etc/supervisor.conf

# install protobuf (may no use)
# RUN yum -y install protobuf protobuf-python
RUN yum clean all
CMD [ "/usr/sbin/init" ]


