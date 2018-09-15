FROM centos:7

RUN yum install -y epel-release gcc gcc-c++ make autoconf file bzip2
RUN yum install -y libmcrypt-devel libjpeg-devel libpng-devel freetype-devel curl-devel openssl-devel libxml2-devel \
    libtool-ltdl-devel gd-devel patch libmhash-devel ncurses-devel mysql-devel 

RUN mkdir -p /wwwroot/php/etc && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
WORKDIR /wwwroot

# libiconv
# RUN curl -o libiconv-1.14.tar.gz http://dl.wdlinux.cn:5180/soft/libiconv-1.14.tar.gz \
RUN curl -o libiconv-1.14.tar.gz https://mirrors.tuna.tsinghua.edu.cn/gnu/libiconv/libiconv-1.14.tar.gz \
    && tar -zxvf libiconv-1.14.tar.gz \
    && cd libiconv-1.14/ \
    && sed -i -e '/gets is a security/d' ./srclib/stdio.in.h \
    && ./configure \
    && make && make install \
    && ldconfig \
    && cd /wwwroot && rm -rf libiconv-1.14 libiconv-1.14.tar.gz

# php
# RUN curl -L -o php-5.3.17.tar.gz http://dl.wdlinux.cn:5180/soft/php-5.3.17.tar.gz \
RUN curl -o php-5.3.17.tar.gz https://museum.php.net/php5/php-5.3.17.tar.gz \
    && tar -zxvf php-5.3.17.tar.gz \
    && cd php-5.3.17 \
    && ./configure --prefix=/wwwroot/php --with-config-file-path=/wwwroot/php/etc \
    --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd \
    --with-iconv=/usr/local --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib \
    --with-libxml-dir=/usr -with-curl --with-mcrypt=/usr --with-openssl --with-mhash \
    --enable-xml --disable-rpath --enable-inline-optimization \
    --enable-mbregex --enable-mbstring --with-gd --enable-gd-native-ttf \
    --enable-ftp --enable-sockets --enable-zip --enable-fpm \
    && make && make install \
    && cd /wwwroot && rm -rf php-5.3.17 php-5.3.17.tar.gz

# COPY ./php-fpm.conf ./php.ini /wwwroot/php/etc/
# VOLUME [ "/logs" ]
EXPOSE 9000
CMD ['/wwwroot/php/sbin/php-fpm']
