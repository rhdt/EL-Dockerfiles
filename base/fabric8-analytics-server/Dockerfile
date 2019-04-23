FROM quay.io/openshiftio/rhel-base-pcp:latest

COPY hack/_copr_msrb-mercator.repo /etc/yum.repos.d/

# python3-pycurl is needed for Amazon SQS (boto lib), we need CentOS' rpm - installing it from pip results in NSS errors
RUN yum-config-manager --enable rhel-7-server-optional-rpms && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum install -y gcc patch git python36-pip python36-requests httpd httpd-devel \
                   python36-devel postgresql-devel redhat-rpm-config libxml2-devel \
                   libxslt-devel python36-pycurl openssl-devel mercator &&\
    yum clean all
