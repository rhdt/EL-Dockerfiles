FROM registry.access.redhat.com/rhel7

RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm &&\
    yum -y install pgbouncer postgresql &&\
    yum clean all
