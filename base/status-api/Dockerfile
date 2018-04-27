FROM prod.registry.devshift.net/osio-prod/base/openshift-nginx:latest
LABEL maintainer "Devtools <devtools@redhat.com>"
LABEL author "Devtools <devtools@redhat.com>"

USER root

RUN yum -y install python-pip python-devel gcc && \
    yum clean all
