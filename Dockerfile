# mminderbinder/java-jdk:oracle-java8
FROM mminderbinder/baseimage
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>


RUN add-apt-repository ppa:webupd8team/java
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true \
	| /usr/bin/debconf-set-selections
RUN apt-get update && apt-get -y install \
	oracle-java8-installer \
	oracle-java8-set-default \
	oracle-java8-unlimited-jce-policy

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]
