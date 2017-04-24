#!/bin/bash

FILE=`echo -n "${@:1}" | gawk 'match($0, /-f +([^ ]+)/, a) {print a[1]}'`

if [ -f "$FILE" ]; then
	sed -r -i "s/(.*?)\{\{([^ ]+?)\}\}(.*?)/echo -n '\1'\"\${\2}\"'\3'/ge" $FILE
fi
echo -n "${PLUGIN_CA}" > /tmp/ca.crt
kubectl_org -s ${PLUGIN_SERVER} --token=${PLUGIN_TOKEN} --certificate-authority=/tmp/ca.crt ${@:1}
