FROM registry.access.redhat.com/rhel7

RUN yum-config-manager --enablerepo=rhel-7-server-optional-rpms && \
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum -y install git zip unzip awscli &&\
    yum -y install java java-devel maven &&\
    yum clean all
