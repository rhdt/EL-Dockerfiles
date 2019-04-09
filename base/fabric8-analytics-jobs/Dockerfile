FROM quay.io/openshiftio/rhel-base-pcp:latest

RUN yum-config-manager --enable rhel-7-server-optional-rpms && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y python36-devel python36-pip postgresql-devel gcc git maven zip unzip && \
    yum clean all
