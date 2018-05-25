FROM quay.io/openshiftio/rhel-base-pcp:latest

RUN yum install -y valgrind httpd-tools hmaccalc strace \
    http://mirror.centos.org/centos/7.4.1708/paas/x86_64/openshift-origin/origin-clients-3.7.1-2.el7.x86_64.rpm \
    && yum clean all
