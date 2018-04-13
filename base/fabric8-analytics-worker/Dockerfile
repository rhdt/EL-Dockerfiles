FROM registry.devshift.net/osio-prod/base/pcp:latest

# https://copr.fedorainfracloud.org/coprs/jpopelka/mercator/
# https://copr.fedorainfracloud.org/coprs/fche/pcp/
COPY hack/_copr_jpopelka-mercator.repo /etc/yum.repos.d/

# Install RPM dependencies
COPY hack/install_deps_rpm.sh /tmp/install_deps/
RUN yum-config-manager --enablerepo=rhel-7-server-optional-rpms && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    /tmp/install_deps/install_deps_rpm.sh && \
    yum clean all
