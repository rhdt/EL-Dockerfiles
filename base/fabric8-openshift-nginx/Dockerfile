FROM prod.registry.devshift.net/osio-prod/base/openshift-nginx:latest
LABEL maintainer "Devtools <devtools@redhat.com>"
LABEL author "Devtools <devtools@redhat.com>"

ENV LANG=en_US.utf8

USER root

ADD root /

# Clear out the default config
RUN rm -rf /etc/nginx/conf.d/default.conf

RUN rm /usr/share/nginx/html/*

ENV FABRIC8_USER_NAME=fabric8
RUN useradd --no-create-home -s /bin/bash ${FABRIC8_USER_NAME}

RUN chmod +rx /run.sh /template.sh
RUN chmod -R +r /usr/share/nginx/html
RUN chmod -R +rw /var/log/nginx
RUN chmod -R a+rw /etc/nginx

# Add the templater to run.sh
RUN sed -i "2s/^/\/template.sh \/usr\/share\/nginx\/html\nVARS='\$PROXY_PASS_URL' \/template.sh \/etc\/nginx\/nginx.conf  \n/" /run.sh

USER ${FABRIC8_USER_NAME}
