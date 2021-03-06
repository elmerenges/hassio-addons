ARG BUILD_FROM
ARG BUILD_VERSION
ARG BUILD_UPSTREAM="fd4f0429"
FROM ${BUILD_FROM}${BUILD_UPSTREAM}

# Copy root filesystem
COPY rootfs /

# Base system
ARG BASHIO_VERSION=0.13.0
ARG TEMPIO_VERSION=2021.01.0
ARG BUILD_ARCH

RUN \
# Install script
    chmod a+x /run.sh \
    \
# Add apps
    && apk add --no-cache \
    jq \
    curl \
    cifs-utils \
    nginx \
    \
# Install tempio
    && curl -L -f -s -o /usr/bin/tempio \
        "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}" \
    && chmod a+x /usr/bin/tempio \
    \
# Install bashio
    && mkdir -p /tmp/bashio \
    && curl -L -f -s "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
        | tar -xzf - --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio \
# Allow UID and GID setting
    && sed -i 's/bash/bashio/g' /etc/cont-init.d/10-adduser \
    && sed -i 's/{PUID:-911}/(bashio::config "PUID")/g' /etc/cont-init.d/10-adduser \
    && sed -i 's/{PGID:-911}/(bashio::config "PGID")/g' /etc/cont-init.d/10-adduser \
# Correct visualization bug on mobile
#    && sed -i 's|content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1.0"|content="width=980, initial-scale=1.0"|g' /app/scrutiny-web/index.html \
# use /data instead of /config for database
    && sed -i 's| /config| /data|g' /defaults/scrutiny.yaml \
    && sed -i 's| /config| /data|g' /etc/cont-init.d/* \
    && sed -i 's| /config| /data|g' /etc/logrotate.d/scrutiny \
    && sed -i 's| /config| /data|g' /etc/crontabs/root \
# analyse local devices at reboot
#   && sed -i '$d' /etc/crontabs/root \
#   && sed -i -e '$a @reboot /run.sh' /etc/crontabs/root \
#   && sed -i -e '$a 0 * * * * /run.sh' /etc/crontabs/root \
# correct url paths  
    && grep -rl '/web/' /app/scrutiny-web/ | xargs sed -i 's|/web/|./|g'

VOLUME [ "/data" ]
