FROM registry.access.redhat.com/rhel7
MAINTAINER Devtools <devtools@redhat.com>

ENV LANG=en_US.utf8
ENV FABRIC8_USER_NAME=fabric8

ADD yum-repo-nginx-testing.repo /etc/yum.repos.d/nginx-testing.repo
ADD root /

RUN yum install --setopt=tsflags=nodocs -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y --enablerepo=nginx-testing install --setopt=tsflags=nodocs nginx gettext && \
    yum clean all && \
    mkdir -p /usr/share/nginx/html

RUN useradd --no-create-home -s /bin/bash ${FABRIC8_USER_NAME}

RUN rm /usr/share/nginx/html/*
RUN rm -rf /etc/nginx/conf.d/default.conf

RUN chmod -R 777 /run.sh /usr/share/nginx/html /run /var/log/nginx
RUN chmod -R a+rw /etc/nginx

USER ${FABRIC8_USER_NAME}

EXPOSE 8080
ENTRYPOINT ["/run.sh"]
