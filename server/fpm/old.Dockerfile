FROM centos:7


RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# RUN yum install -y yum-utils
# RUN yum-config-manager --enable remi-php54 && yum update
# RUN yum install -y gcc gcc-c++ make autoconf file bzip2
# RUN yum install -y libmcrypt-devel libjpeg-devel libpng-devel freetype-devel curl-devel openssl-devel libxml2-devel libtool-ltdl-devel gd-devel patch libmhash-devel ncurses-devel mysql-devel
# RUN yum install php54 php54-common php54-php-mysqlnd php54-fpm php54-php-intl php54-php-gd php54-php-pecl-zip php54-php-mbstring php54-php-pecl-zip

RUN yum install -y gcc gcc-c++ make autoconf file bzip2 patch
RUN yum install -y mysql-devel \
    libmcrypt-devel gd-devel libjpeg-devel libpng-devel libXpm-devel \
    gettext-devel freetype-devel bzip2-devel libticonv-devel zlib-devel \
    curl-devel openssl-devel libxml-devel libxml2-devel \
    libtool-ltdl-devel libmhash-devel ncurses-devel pcre-devel \
    libicu-devel 1>/dev/null

ARG phpver=5.4.26
ARG iconvver=1.14

RUN mkdir -p /wwwroot/php/etc && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
WORKDIR /wwwroot

RUN curl -L -o php-${phpver}.tar.gz http://cn2.php.net/get/php-${phpver}.tar.gz/from/this/mirror
RUN curl -L -o libiconv-${iconvver}.tar.gz https://mirrors.tuna.tsinghua.edu.cn/gnu/libiconv/libiconv-${iconvver}.tar.gz
# libiconv
# RUN curl -o libiconv-${iconvver}.tar.gz http://dl.wdlinux.cn:5180/soft/libiconv-${iconvver}.tar.gz \
RUN cd /wwwroot \
    && tar -zxf libiconv-${iconvver}.tar.gz \
    && cd libiconv-${iconvver} \
    && sed -i -e '/gets is a security/d' ./srclib/stdio.in.h \
    && ./configure --prefix=/usr/local/libiconv 1>/dev/null \
    && make 1>/dev/null \
    && make install \
    && rm -rf libiconv-${iconvver} libiconv-${iconvver}.tar.gz \
    && ldconfig

# && ./configure 1>/dev/null \

# php
# RUN curl -L -o php-${phpver}.tar.gz http://cn2.php.net/get/php-${phpver}.tar.gz/from/this/mirror \
RUN ln -s  /usr/lib64/libXpm.so* /usr/lib/
RUN cd /wwwroot  \
    && tar -zxf php-${phpver}.tar.gz \
    && cd php-${phpver} \
    && ./configure --prefix=/wwwroot/php \
        --with-config-file-path=/wwwroot/php/etc  \
        --with-mysql=mysqlnd \
        --with-mysqli=/usr/bin/mysql_config  \
        --with-libxml-dir=/usr/local/libxml2 \
        --with-pcre-dir \
        --with-mcrypt \
        --with-gd \
        --with-jpeg-dir \
        --with-png-dir \
        --with-xpm-dir=/usr/lib64/x11 \
        --with-gettext \
        --with-freetype-dir \
        --with-bz2 \
        --with-iconv=/usr/local/libiconv \
        --with-zlib \
        --with-zlib-dir \
        --with-curl \
        --enable-fpm \
        --with-icu-dir=/usr \
        --enable-intl --enable-sockets --enable-gd-native-ttf --enable-gd-jis-conv \
        --enable-ftp --enable-zip --enable-calendar --enable-mbstring \
        --enable-exif --enable-fd-setsize=4096 --disable-short-tags --disable-ipv6 \
    && make 1>/dev/null \
    && make install \
    && cd /wwwroot && rm -rf php-${phpver} php-${phpver}.tar.gz

# COPY ./php-fpm.conf ./php.ini /wwwroot/php/etc/
# VOLUME [ "/logs" ]
EXPOSE 9000
