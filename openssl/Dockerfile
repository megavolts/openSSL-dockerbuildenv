ARG BUILD_REPOSITORY="megavolts/openssl-dockerbuildenv" \
    BUILD_NAME="OpenSSL-dockerbuildenv" \
    BUILD_DESCRIPTION="Alpine Linux based OpenSSL build environment for megavolts/unbound and follow up project. " \
    BUILDENV_BUILD_DATE \
    OPENSSL_VERSION \
    OPENSSL_BUILDENV_VERSION

# Define shell
# Stage 1. Build Unbound with latest OpenSSL
FROM --platform=$BUILDPLATFORM  alpine:latest AS buildenv

# Set shell
SHELL ["/bin/sh", "-o", "pipefail", "-c"] 

# Define argument
ARG OPENSSL_VERSION \
    BUILD_REPOSITORY \
    BUILD_DESCRIPTION \
    OPENSSL_BUILDENV_VERSION \
    BUILD_NAME

# Define environment variables
ENV OPENSSL_VERSION=${OPENSSL_VERSION} \
    OPENSSL_PGP="BA5473A2B0587B07FB27CF2D216094DFD0CB81EF" \
    OPENSSL_DOWNLOAD_URL="https://github.com/openssl/openssl/releases/download/openssl-"${OPENSSL_VERSION}"/openssl-"${OPENSSL_VERSION}".tar.gz"
WORKDIR /tmp/src

# Build OpenSSl from sources with checksum
RUN echo $OPENSSL_VERSION
RUN apk --no-cache --update add \
        ca-certificates \
        curl \
        file \
        gnupg \
    && apk --update add --no-cache --virtual .build-deps \
        build-base \
        perl \
        libevent-dev \
        libidn2-dev \
        linux-headers \
        apk-tools \
# -L rather -sSL
    && curl -L ${OPENSSL_DOWNLOAD_URL} -o openssl-${OPENSSL_VERSION}.tar.gz \
    && curl -L ${OPENSSL_DOWNLOAD_URL}.sha256 -o openssl-${OPENSSL_VERSION}.tar.gz.sha256 \
    && curl -L ${OPENSSL_DOWNLOAD_URL}.asc -o openssl-${OPENSSL_VERSION}.tar.gz.asc \
    && echo "`cat openssl-${OPENSSL_VERSION}.tar.gz.sha256`" | sha256sum -c - \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && gpg --no-tty --keyserver hkps://keys.openpgp.org --recv-keys ${OPENSSL_PGP} \
    && gpg --batch --verify openssl-${OPENSSL_VERSION}.tar.gz.asc openssl-${OPENSSL_VERSION}.tar.gz \
    && pkill -9 gpg-agent \
    && pkill -9 dirmngr \
    && tar xzf openssl-${OPENSSL_VERSION}.tar.gz \
    && rm openssl-${OPENSSL_VERSION}.tar.gz \
    && cd openssl-${OPENSSL_VERSION} \
    && ./Configure \
        no-weak-ssl-ciphers \
        no-apps \
        no-docs \
        no-legacy \
        no-ssl3 \
        no-err \
        no-autoerrinit \
        enable-tfo \
        enable-quic \
        enable-ktls \
        enable-ec_nistp_64_gcc_128 \
        -fPIC \
        -DOPENSSL_NO_HEARTBEATS \
        -fstack-protector-strong \
        -fstack-clash-protection \
        --prefix=/usr/local/openssl \
        --openssldir=/usr/local/openssl \
        --libdir=/usr/local/openssl/lib \
    && make \
    && make install_sw \
    && apk del --no-cache .build-deps \
    && rm -rf \
        /usr/share/man \
        /usr/share/docs \
        /usr/local/openssl/bin \
        /tmp/* \
        /var/tmp/* \
        /var/log/* 

LABEL maintainer="megavolts <marc.oggier@megavolts.ch>" \
      org.opencontainers.image.version=$OPENSSL_BUILDENV_VERSION \
    #   org.opencontainers.image.title=$BUILD_NAME \
    #   org.opencontainers.image.description=$BUILD_DESCRIPTION \
      org.opencontainers.image.url="https://github.com/"${BUILD_REPOSITORY} \
      org.opencontainers.image.vendor="Marc Oggier" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/"${BUILD_REPOSITORY}