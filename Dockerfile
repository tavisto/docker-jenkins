FROM ubuntu:14.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

RUN apt-get install wget -q -y
RUN /usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ >> /etc/apt/sources.list
RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless jenkins && apt-get clean

EXPOSE 8080
VOLUME ["/jenkins"]
CMD service jenkins start && /usr/bin/tail -F /var/log/jenkins/jenkins.log
