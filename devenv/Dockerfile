FROM centos:centos7
ENV VER 1.10.5
ENV JAVA_HOME=/usr/java/jdk1.8.0_131
RUN yum install wget -y
RUN yum install git -y
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm -P /root
RUN rpm -ivh /root/jdk-8u131-linux-x64.rpm
RUN wget https://www-eu.apache.org/dist//ant/binaries/apache-ant-1.10.5-bin.tar.gz
RUN  tar -xvzf apache-ant-${VER}-bin.tar.gz
RUN mv apache-ant-1.10.5  /opt

ADD ant.sh /etc/profile.d/
CMD ["sh","load.sh"]

