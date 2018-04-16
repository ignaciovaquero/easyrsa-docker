FROM debian:stretch-slim
LABEL maintainer="Ignacio Vaquero <ivaqueroguisasola@gmail.com>" \
      org.opencontainers.image.authors="Ignacio Vaquero <ivaqueroguisasola@gmail.com>" \
      org.opencontainers.image.source="https://github.com/igvaquero18/easyrsa-docker" \
      org.opencontainers.image.title="ivaquero/easyrsa3" \
      org.opencontainers.image.description="Easy RSA docker container" \
      org.opencontainers.image.version="0.1.0"

ARG TINI_VERSION=v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN chmod +x /tini && \
    apt-get update -y && \
    apt-get install -y git vim=2:8.0.0197-4+deb9u1 && \
    git clone https://github.com/OpenVPN/easy-rsa.git /easy-rsa && \
    apt-get remove -y git

WORKDIR /easy-rsa/easyrsa3

ENTRYPOINT ["/tini", "--"]
CMD ["/easy-rsa/easyrsa3/easyrsa"]
