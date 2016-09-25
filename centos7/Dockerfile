
FROM centos:7

MAINTAINER aegoose "aegoose@126.com"

# dns with aliyun/pub/google
# RUN "sh" "-c" "echo nameserver 223.5.5.5 > /etc/resolv.conf \
# && echo nameserver 114.114.114.114 >> /etc/resolv.conf \
# && echo nameserver 8.8.8.8 >> /etc/resolv.conf"

# RUN echo "nameserver 223.5.5.5" > /etc/resolv.conf \
#  && echo "nameserver 114.114.114.114" >> /etc/resolv.conf \
#  && echo "nameserver 8.8.8.8" >? /etc/resolv.conf

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.org

# RUN curl http://mirrors.aliyun.com/repo/Centos-7.repo -o /etc/yum.repos.d/Centos7-Base-aliyun.repo
RUN curl http://mirrors.163.com/.help/CentOS7-Base-163.repo -o /etc/yum.repos.d/CentOS-Base-163.repo

RUN yum install -y epel-release gcc-c++ make cronie
# RUN yum -y install sudo epel-release && yum clean all
# config yum for centos7
# RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN yum clean all
#&& yum makecache

CMD [ "/usr/sbin/init" ]

