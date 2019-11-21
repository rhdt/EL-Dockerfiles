FROM registry.access.redhat.com/rhel7

RUN yum-config-manager --enable rhel-7-server-optional-rpms && \
    yum --setopt=tsflags=nodocs install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum --setopt=tsflags=nodocs install -y python36-pip wget python36-devel libxml2-devel libxslt-devel python36-requests python36-pycurl \
    http://mirror.centos.org/centos/7/paas/x86_64/openshift-origin/origin-clients-3.6.1-1.0.008f2d5.x86_64.rpm && \
    yum clean all

# Verify packages are installed
RUN rpm -q --queryformat "" python36-pip wget python36-devel libxml2-devel libxslt-devel python36-requests python36-pycurl origin-clients
