FROM maven:3-jdk-8

ENV LANG C.UTF-8

RUN \
  apt-get update && \
  apt-get install -y python3.6 python3-pip && \
  pip install -y kazoo pyyaml
 
######installing npm and nodejs 
RUN \
  curl -sL https://deb.nodesource.com/setup_12.x | sudo bash - && \
  apt-get install -y nodejs

RUN \
  cd /tmp && \
  wget -q http://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz && \
  tar -xvf zookeeper-3.4.6.tar.gz && \
  rm zookeeper-3.4.6.tar.gz && \
  
  
