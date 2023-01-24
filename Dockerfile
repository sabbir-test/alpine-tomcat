FROM alpine:3.17                                                                                                                                               
MAINTAINER Sabbir_khan
COPY  tomcat.zip /opt/
RUN apk add openjdk11 && \
        rm -rf /var/cache/apk/* && \
        addgroup -S tomcat && \
        adduser -S tomcat -G tomcat && \
	unzip /opt/tomcat.zip -d /opt/ && \
        rm -f /opt/tomcat.zip && \
        chown -R tomcat:tomcat /opt/tomcat
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
WORKDIR /opt/tomcat/webapps/
USER tomcat       
EXPOSE 8080 443
CMD /bin/sh /opt/tomcat/bin/catalina.sh run

  
