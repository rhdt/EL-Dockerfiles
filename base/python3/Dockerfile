FROM registry.access.redhat.com/rhel7

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum install -y gcc git python34-pip python34-requests httpd httpd-devel python34-devel &&\
    yum install -y redhat-rpm-config libffi-devel openssl-devel &&\
    yum clean all
