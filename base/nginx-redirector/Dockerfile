FROM quay.io/openshiftio/base-openshift-nginx:latest
LABEL maintainer "Devtools <devtools@redhat.com>"
LABEL author "Devtools <devtools@redhat.com>"

# Labels consumed by the build service
LABEL Name="nginx-redirector" \
      Version="1"

USER root

RUN chmod -R 777 /var/lib/nginx

COPY nginx.conf.template /
COPY docker-entrypoint.sh /

EXPOSE 8080

USER 1001

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-c", "/tmp/nginx.conf"]
