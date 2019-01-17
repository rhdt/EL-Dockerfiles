FROM quay.io/openshiftio/rhel-base-jboss-jdk-8:latest

# The following lines are needed to set the correct locale after `yum update`
# c.f. https://github.com/CentOS/sig-cloud-instance-images/issues/71
RUN localedef -i en_US -f UTF-8 C.UTF-8

RUN yum -y update && \
    yum -y install sudo && \
    yum -y install containers-common && \
    curl -sSL "https://get.docker.com/builds/Linux/x86_64/docker-1.6.0" -o /usr/bin/docker && \
    chmod +x /usr/bin/docker && \
    yum clean all && \
    echo "%root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers && \
    rm -rf /tmp/* /var/cache/yum
