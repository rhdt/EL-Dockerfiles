FROM registry.access.redhat.com/rhel7
ENV LANG=en_US.utf8

COPY pcp.repo /etc/yum.repos.d/pcp.repo
RUN yum install -y epel-release && \
    yum install -y pcp pcp-pmda-prometheus nodejs && \
    yum clean all && \
    mkdir -p /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp  && \
    chgrp -R root /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp && \
    chmod -R g+rwX /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp
