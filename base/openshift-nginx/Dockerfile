FROM registry.access.redhat.com/rhel7
LABEL maintainer "Devtools <devtools@redhat.com>"
LABEL author "Devtools <devtools@redhat.com>"

RUN yum install --setopt=tsflags=nodocs -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y install --setopt=tsflags=nodocs nginx gettext && \
    yum clean all && \
    mkdir -p /usr/share/nginx/html

ADD root /

RUN chmod 777 /run.sh
RUN chmod -R 777 /usr/share/nginx/html/
RUN echo "nginx on CentOS7" > /usr/share/nginx/html/index.html
RUN chmod 777 /run /var/log/nginx

EXPOSE 8080
USER 997
ENTRYPOINT ["/run.sh"]
