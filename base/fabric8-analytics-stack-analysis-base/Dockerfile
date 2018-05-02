FROM registry.access.redhat.com/rhel7

# enable rhel-7-server-optional-rpms for getiing tkinter
RUN yum-config-manager --enable rhel-7-server-optional-rpms && \ 
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y zip python-pip python-devel gcc tkinter gcc-c++.x86_64 && \
    yum clean all

COPY ./hack/requirements.txt /requirements.txt

RUN pip install -r /requirements.txt && rm /requirements.txt

# Cannot install this as a part of requirements due to an upstream
# dependency resolution issue, please keep as is.
RUN pip install pomegranate==0.7.3
