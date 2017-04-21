#!/bin/bash

FILE=`echo -n "${@:1}" | gawk 'match($0, /-f +([^ ]+)/, a) {print a[1]}'`

if [ -f "$FILE" ]; then
	sed -r -i 's/(.*?)\{\{([^ ]+?)\}\}(.*?)/echo "\1${\2}\3"/ge' $FILE
fi
echo -n ${KUBE_CA} > /tmp/ca.crt
kubectl_org -s ${KUBE_SERVER} --token=${KUBE_TOKEN} --certificate-authority=/tmp/ca.crt ${@:1}
