
FROM aegoose/golang 

MAINTAINER aegoose "aegoose@126.com"

# RUN hostname go

RUN yum install -y epel-release gcc-c++ make
RUN yum install -y redis memcached python-devel python-pip
# config yum for centos7
# RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
# RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# dependency compile libs
# below is other libs auto enabled by php install
# yum -y install libjpeg libpng freetype libmcrypt libxml2 openssl libcurl zlib pcre gd
# yum -y install libjpeg-devel libpng-devel freetype-devel libmcrypt-devel \
#   libxml2-devel openssl-devel libcurl-devel zlib-devel \
#   pcre-devel ncurses-devel gd-devel

# install redis (only use redis-cli)
# RUN yum --enablerepo=epel -y install redis
# install memcached (only use memcached lib)
# RUN yum -y install memcached

# python plugin install
# 1.python install dependency
# RUN yum -y install python-devel
# dependency: python-devel:2.7.5  python:2.7.5  python-libs:2.7.5
# 2.install pip
# RUN curl https://bootstrap.pypa.io/get-pip.py | python 
# dependency: python-setuptools:0.9.8   python-backports:1.0   python-backports-ssl_match_hostname:3.4.0.2
# 2.install tools
RUN pip install Twisted redis protobuf supervisor
# install protobuf (may no use)
# RUN yum -y install protobuf protobuf-python
# install sphinx
# RUN yum install sphinx 
# dependency: mariadb-libs:5.5.5 postgresql-libs:9.2.15 

# install mqtt
RUN curl -o /etc/yum.repos.d/mqtt.repo http://download.opensuse.org/repositories/home:/oojah:/mqtt/CentOS_CentOS-7/home:oojah:mqtt.repo \
  && yum -y install mosquitto \
        mosquitto-clients \
        libmosquitto1 \
        libmosquitto-devel \
        libmosquittopp1 \
        libmosquittopp-devel \
        python-mosquitto

ENV GOPATH="/usr/local/go"
ENV PATH="${GOPATH}/bin:${PATH}"

# install revel-0.12
RUN rm -rf /usr/local/go/src/github.com/revel \
  && mkdir -p /usr/local/go/src/github.com/revel \
  && git clone -b v0.12.0 \
          https://github.com/revel/revel.git \
          /usr/local/go/src/github.com/revel/revel \
  && git clone -b v0.12.0 \
          https://github.com/revel/cmd.git \
          /usr/local/go/src/github.com/revel/cmd \
  && git clone -b v0.12.0 \
          https://github.com/revel/modules \
          /usr/local/go/src/github.com/revel/modules \
  && git clone https://github.com/golang/net.git \
          /usr/local/go/src/github.com/golang/net \
  && git clone https://github.com/golang/sys.git \
          /usr/local/go/src/github.com/golang/sys \
  && rm -rf /usr/local/go/src/golang.org/x \
    && mkdir -p /usr/local/go/src/golang.org/x \
    && cd /usr/local/go/src/ \
    && ln -sf /usr/local/go/src/github.com/golang/net golang.org/x/net \
    && ln -sf /usr/local/go/src/github.com/golang/sys golang.org/x/sys 

# revel-0.12 need to rebuild
RUN go get github.com/agtorre/gocolorize \
  github.com/robfig/config \
  github.com/robfig/pathtree \
  gopkg.in/fsnotify.v1

# build revel
RUN cd /usr/local/go/src \
    && go build -o ../bin/revel github.com/revel/cmd/revel/ 

# plugin for platform-core ...
RUN go get github.com/beego/bee \
  github.com/jinzhu/gorm \
  github.com/astaxie/beego/httplib \
  github.com/garyburd/redigo/redis \
  github.com/go-sql-driver/mysql \
  github.com/astaxie/beego/logs \
  github.com/eclipse/paho.mqtt.golang \
  github.com/ErikDubbelboer/gspt \
  github.com/stretchr/testify/assert \
  github.com/syndtr/goleveldb/leveldb \
  github.com/jeffail/tunny \
  github.com/robfig/cron \
  github.com/pborman/uuid

RUN yum clean all
# COPY ./sphinx/sphinx.conf /etc/sphinx.conf
# COPY ./redis/redis.conf /etc/redis.conf
# COPY ./supervisord/supervisor.conf /etc/supervisor.conf

CMD [ "/usr/sbin/init" ]


