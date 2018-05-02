FROM prod.registry.devshift.net/osio-prod/base/pcp:latest

RUN yum -y update && \
    yum-config-manager --enablerepo=rhel-7-server-optional-rpms && \ # for getiing tkinter
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y install python-pip git zip python-devel gcc tkinter gcc-c++.x86_64 && \
    pip install --upgrade pip && \
    yum clean all
