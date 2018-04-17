FROM registry.access.redhat.com/rhel7

ADD ./install.sh ./fix-permissions.sh /opt/scripts/

RUN chmod -R 777 /opt/scripts && . /opt/scripts/install.sh
