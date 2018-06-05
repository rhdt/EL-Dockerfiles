FROM registry.access.redhat.com/rhel7
ENV LANG=en_US.utf8

ENV PCP_PACKAGES="pcp pcp-pmda-prometheus pcp-manager pcp-debuginfo \
                    pcp-export-pcp2zabbix pcp-system-tools pcp-webapi \
                    pcp-webapps pcp-pmda-postgresql"

ENV PCP_DIRS="/etc/pcp /var/run/pcp /var/lib/pcp /var/log/pcp"

COPY pcp.repo /etc/yum.repos.d/pcp.repo

RUN yum -y update && yum install -y $PCP_PACKAGES && yum clean all && \
    mkdir -p $PCP_DIRS  && \
    chgrp -R root $PCP_DIRS && \
    chmod -R g+rwX $PCP_DIRS

# check that the packages have been installed, yum install may return 0 even
# if a package was not successfully installed
RUN rpm --query --queryformat "" $PCP_PACKAGES
