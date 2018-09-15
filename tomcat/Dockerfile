FROM tomcat:7

MAINTAINER aegoose<aegoose@126.com>

ENV APP_NAME "tropicMobile-1.0"

RUN rm -rf $CATALINA_HOME/webapps

# COPY server.xml ${CATALINA_HOME}/conf/server.xml
COPY "$APP_NAME.war" $CATALINA_HOME/webapps/

RUN sed -i "//a" ${CATALINA_HOME}/conf/server.xml

VOLUME ["$CATALINA_HOME/logs"]

EXPOSE 8080
CMD ["catalina.sh", "run"]

