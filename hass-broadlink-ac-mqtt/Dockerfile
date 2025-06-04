ARG BUILD_FROM
FROM $BUILD_FROM

COPY rootfs /

RUN apk add --no-cache gcc g++ make \
    && pip3 install --no-cache-dir -U \
    paho-mqtt \
    pyyaml \
    pycrypto \
    && cd /usr/share \
    #&& wget -c https://github.com/elmerenges/hass-broadlink-ac-mqtt/archive/refs/tags/default.tar.gz -O - | tar -xz \
    && wget -c https://github.com/elmerenges/broadlink_ac_mqtt/archive/refs/heads/master.tar.gz -O - | tar -xz \
    && chmod a+x /etc/services.d/broadlink-ac-mqtt/*
    
