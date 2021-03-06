#!/usr/bin/with-contenv bashio

#################
# NGINX SETTING #
#################

declare admin_port
declare portainer_protocol=http

# Generate Ingress configuration
if bashio::config.true 'ssl'; then
portainer_protocol=https
fi

bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    protocol "${portainer_protocol}" \
    certfile "$(bashio::config 'certfile')" \
    keyfile "$(bashio::config 'keyfile')" \
    ssl "^$(bashio::config 'ssl')" \
    | tempio \
        -template /etc/nginx/templates/ingress.gtpl \
        -out /etc/nginx/servers/ingress.conf

