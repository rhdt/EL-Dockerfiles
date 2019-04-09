FROM registry.access.redhat.com/rhel7

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum install -y gcc gcc-c++ git python36-pip python36-requests httpd httpd-devel python36-devel &&\
    yum install -y redhat-rpm-config libffi-devel openssl-devel python36-setuptools &&\
    yum clean all
