FROM registry.access.redhat.com/rhel7
MAINTAINER Devtools <devtools@redhat.com>

ENV LANG=en_US.utf8
ENV FABRIC8_USER_NAME=fabric8

ADD root /

RUN yum install --setopt=tsflags=nodocs -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y install --setopt=tsflags=nodocs nginx gettext python-pip python-devel gcc && \
    yum clean all && \
    rm -f /usr/share/nginx/html/* && \
    useradd --no-create-home -s /bin/bash ${FABRIC8_USER_NAME} && \
    chmod -R 777 /run.sh /usr/share/nginx/html /run /var/log/nginx && \
    chmod -R a+rw /etc/nginx

USER ${FABRIC8_USER_NAME}

EXPOSE 8080
ENTRYPOINT ["/run.sh"]
