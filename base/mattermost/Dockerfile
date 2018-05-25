FROM quay.io/openshiftio/rhel-base-pcp:latest

RUN chown -R 1000 /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp  &&\
    chmod -R ug+rw /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y jq nc tar && yum clean all

