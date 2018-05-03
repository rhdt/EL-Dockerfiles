FROM registry.access.redhat.com/rhel7

RUN mkdir -p /opt/scripts

ADD ./install.sh ./fix-permissions.sh /opt/scripts/

RUN chmod -R 777 /opt/scripts && . /opt/scripts/install.sh
