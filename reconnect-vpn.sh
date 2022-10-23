#!/bin/bash

# Download external script if it doesn't exist
# Stick to the commit hash for security reason

if [ ! -f /root/reconnect-vpn.sh ]; then
    curl https://raw.githubusercontent.com/ianharrier/synology-scripts/05b3c740caccd1ff0a6e9693e2636c36951a405d/reconnect-vpn.sh --output /root/reconnect-vpn.sh
    chmod +x reconnect-vpn.sh
fi

/root/reconnect-vpn.sh
