FROM registry.access.redhat.com/rhel7

RUN yum-config-manager --enablerepo=rhel-7-server-optional-rpms && \ # for getiing tkinter
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y zip python-pip python-devel gcc tkinter gcc-c++.x86_64 && \
    yum clean all

