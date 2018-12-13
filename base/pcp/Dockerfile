FROM registry.access.redhat.com/rhel7
ENV LANG=en_US.utf8

COPY pcp.repo /etc/yum.repos.d/pcp.repo
RUN yum install -y pcp pcp-pmda-prometheus pcp-manager pcp-debuginfo \
                   pcp-export-pcp2zabbix pcp-system-tools pcp-webapi \
                   "pcp-webapp-*" pcp-pmda-postgresql && yum clean all && \
    mkdir -p /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp  && \
    chgrp -R root /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp && \
    chmod -R g+rwX /etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp
