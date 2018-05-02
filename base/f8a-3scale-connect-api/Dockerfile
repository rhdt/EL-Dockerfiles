FROM registry.access.redhat.com/rhel7

# Install deps for cryptography:
#  https://cryptography.io/en/latest/installation/#rhel-centos
RUN yum install -y gcc &&\
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum install -y python34-pip &&\
    yum install -y redhat-rpm-config gcc libffi-devel python34-devel openssl-devel &&\
    yum clean all
