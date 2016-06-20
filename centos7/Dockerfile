
FROM centos:7

MAINTAINER aegoose "aegoose@126.com"

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.org

RUN curl http://mirrors.163.com/.help/CentOS7-Base-163.repo -o /etc/yum.repos.d/CentOS-Base-163.repo

RUN yum clean all && yum -y update
# & yum makecache

# RUN yum -y install sudo epel-release && yum clean all

RUN yum -y update && yum clean all

CMD [ "/usr/sbin/init" ]

