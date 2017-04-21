FROM alpine:3.5

ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.1/bin/linux/amd64/kubectl /kubectl
RUN set -x && \
    apk add --update --no-cache bash curl ca-certificates && \
    cp /bin/bash /bin/sh && \
    chmod +x /kubectl 
    

ENTRYPOINT ["/kubectl"]
