#!/bin/bash
/template.sh /usr/share/nginx/html
VARS='$PROXY_PASS_URL' /template.sh /etc/nginx/nginx.conf
echo "----"
id
echo "----"

ls -al /var/lib/nginx/
ls -al /var/log/nginx/

nginx -c /etc/nginx/nginx.conf
