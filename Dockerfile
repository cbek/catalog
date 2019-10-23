FROM python:3

ARG KUSTOMIZE_VERSION=3.2.3

RUN if dpkg --compare-versions "$KUSTOMIZE_VERSION" "lt" "3.2.1"; \
    then export KUSTOMIZE_BINARY_PATH=https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64 ; \
    else export KUSTOMIZE_BINARY_PATH=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_kustomize.v${KUSTOMIZE_VERSION}_linux_amd64 ; \
    fi && \
    curl -Lso /usr/local/bin/kustomize ${KUSTOMIZE_BINARY_PATH} \
    && chmod +x /usr/local/bin/kustomize \
    && kustomize version
