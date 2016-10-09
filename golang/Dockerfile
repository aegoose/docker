
FROM aegoose/centos7

MAINTAINER aegoose "aegoose@126.com"

RUN yum -y install golang git
RUN yum -y update && yum clean all

ENV GOPATH /usr/local/go
ENV PATH $GOPATH/bin:$PATH

CMD [ "/usr/sbin/init" ]
