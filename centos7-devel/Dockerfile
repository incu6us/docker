FROM centos:centos7

RUN yum install epel-release -y
RUN yum update -y

RUN yum groupinstall "Development Tools" -y
RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
RUN yum install nodejs -y
RUN yum clean all
