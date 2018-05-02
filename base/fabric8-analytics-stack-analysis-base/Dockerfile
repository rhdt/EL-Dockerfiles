FROM registry.access.redhat.com/rhel7

# enable rhel-7-server-optional-rpms for getiing tkinter
RUN yum-config-manager --enable rhel-7-server-optional-rpms && \ 
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y zip python-pip python-devel gcc tkinter gcc-c++.x86_64 && \
    yum clean all
