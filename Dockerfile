FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

ENV GOPATH="${HOME}/go"
ENV PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

RUN apt update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release nano zip tree golang \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && apt-get update && apt-get install -y kubectl docker-ce docker-ce-cli containerd.io  \
    && curl -sSL --output helm.tgz https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz && tar xzvf helm.tgz && chmod +x linux-amd64/helm && mv linux-amd64/helm /usr/local/bin/helm && rm -Rf helm.tgz linux-amd64/  \
    && curl -sSL --output jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x jq && mv jq /usr/local/bin/jq \
    && curl -sSL --output yq https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 && chmod +x yq && mv yq /usr/local/bin/yq \
    && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/
