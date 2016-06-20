
FROM aegoose/centos7

MAINTAINER aegoose "aegoose@126.com"

RUN yum -y install golang git && yum clean all 
RUN yum -y update && yum clean all 

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH


