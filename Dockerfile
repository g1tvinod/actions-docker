FROM ubuntu:16.04

ENV LANG C.UTF-8

RUN \
  apt-get update && \
  apt-get install -y wget curl zip unzip tar git python3.6 python3-pip && \
  pip install -y kazoo pyyaml
  
####INSTALL openJDK
RUN \
  apt-get update && \
  apt-get install openjdk-8-jdk -y --no-install-recommends

RUN \
  wget http://apachemirror.wuchna.com/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip && \
  unzip apache-maven-3.6.3-bin.zip && \
  rm apache-maven-3.6.3-bin.zip && \
  mkdir -p /usr/share/maven/ && \
  cp -r apache-maven-3.6.3/* /usr/share/maven/ && \
  ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
  
###SET ENV VARS
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ \
    MAVEN_HOME=/usr/share/maven/ \
    MAVEN_OPTS="-Xmx8192m -XX:MaxPermSize=4096m -Xss10M"

######installing npm and nodejs 
RUN \
  curl -sL https://deb.nodesource.com/setup_12.x | sudo bash - && \
  apt-get install -y nodejs

RUN \
  wget -q http://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz && \
  tar -xvf zookeeper-3.4.6.tar.gz && \
  rm zookeeper-3.4.6.tar.gz
  
  
  
  
