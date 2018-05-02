FROM registry.access.redhat.com/rhel7

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y python34-setuptools gcc gcc-c++ python34-pip python34-devel \
                   libffi-devel openssl-devel && yum clean all
