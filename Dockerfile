#
# To use this image you need:
#
#     KUBE_CA
#     KUBE_SERVER
#     KUBE_TOKEN
#

FROM alpine:3.6

ADD https://storage.googleapis.com/kubernetes-release/release/v1.13.7/bin/linux/amd64/kubectl /bin/kubectl_org
RUN set -x && \
    apk add --update --no-cache bash curl sed gawk ca-certificates && \
    cp /bin/bash /bin/sh && \
    chmod +x /bin/kubectl_org

COPY kubectl.sh /bin/kubectl
COPY entry.sh /entry.sh

RUN chmod +x /bin/kubectl
RUN chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]

