# mminderbinder/java-jdk:oracle-java6
FROM mminderbinder/baseimage
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>


RUN add-apt-repository ppa:webupd8team/java
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true \
	| /usr/bin/debconf-set-selections
RUN apt-get update && apt-get -y install \
	oracle-java6-installer \
	oracle-java6-set-default

ENV JAVA_HOME /usr/lib/jvm/java-6-oracle


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]
