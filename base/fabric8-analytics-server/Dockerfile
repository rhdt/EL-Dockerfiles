FROM prod.registry.devshift.net/osio-prod/base/python3:latest

COPY hack/_copr_jpopelka-mercator.repo /etc/yum.repos.d/

# python3-pycurl is needed for Amazon SQS (boto lib), we need CentOS' rpm - installing it from pip results in NSS errors
RUN yum-config-manager --enable rhel-7-server-optional-rpms && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum install -y patch postgresql-devel redhat-rpm-config libxml2-devel \
                   libxslt-devel python34-pycurl mercator &&\
    yum clean all
