FROM debian:bookworm-slim AS builder

ARG REALM_VERSION="2.7.0"
ARG REALM_URL="https://github.com/zhboner/realm/releases/download/v${REALM_VERSION}/"

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        ca-certificates \
        wget \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && ARCH=`uname -m` \
    && if [ "$ARCH" = "armv7l" ]; then \
            REALM_FILENAME="realm-armv7-unknown-linux-gnueabihf.tar.gz"; \
        else \
            REALM_FILENAME="realm-${ARCH}-unknown-linux-gnu.tar.gz"; \
        fi \
    \
    && wget -O realm.tar.gz ${REALM_URL}${REALM_FILENAME} \
    && tar -xzvf realm.tar.gz -C /usr/local/bin/ \
    && rm -rf realm.tar.gz

######

FROM debian:bookworm-slim

COPY --from=builder /usr/local/bin/ /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/realm"]
