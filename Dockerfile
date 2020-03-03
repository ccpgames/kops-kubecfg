FROM alpine:3.6

ENV KOPS_VERISON=1.14.1
ENV KUBE_PATH=/kube
ENV AWS_DEFAULT_OUTPUT=json
ENV KUBECONFIG=${KUBE_PATH}/config

RUN set -x && \
    apk add --no-cache curl bash ca-certificates

RUN curl -LO https://github.com/kubernetes/kops/releases/download/$KOPS_VERISON/kops-linux-amd64 \
    && chmod +x kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops \
    && kops version

COPY configure.sh .
RUN chmod +x configure.sh

VOLUME ${KUBE_PATH}

CMD [ "/bin/bash", "configure.sh" ]
