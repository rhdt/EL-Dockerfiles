#!/bin/bash
if [[ -z "$REDIRECTOR_DESTINATION" ]]; then echo "Variable REDIRECTOR_DESTINATION not set. Aborting."; exit 1; fi
if [[ -z "$REDIRECTOR_TYPE" ]]; then echo "Variable REDIRECTOR_TYPE not set. Aborting."; exit 1; fi

if [[ "$REDIRECTOR_TYPE" != "redirect" ]] && [[ "$REDIRECTOR_TYPE" != "permanent" ]]; then
    echo "REDIRECTOR_TYPE should be set to either redirect or permanent. Aborting."
    exit 1;
fi

# Add trailing slash
REDIRECTOR_DESTINATION=${REDIRECTOR_DESTINATION%/} # Strip trailing slash if any
REDIRECTOR_DESTINATION="$REDIRECTOR_DESTINATION/"  # Add trailing slash

echo "Configuring redirector to redirect all traffic to $REDIRECTOR_DESTINATION $REDIRECTOR_TYPE"
/bin/cp -fv /nginx.conf.template /tmp/nginx.conf
sed -e "s@REDIRECTOR_DESTINATION@$REDIRECTOR_DESTINATION@g" -i /tmp/nginx.conf
sed -e "s@REDIRECTOR_TYPE@$REDIRECTOR_TYPE@g" -i /tmp/nginx.conf

exec "$@"