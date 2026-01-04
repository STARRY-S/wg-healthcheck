#!/bin/bash

cd $(dirname $0)

if [[ "$(id -u)" -ne 0 ]]; then
    echo "Please run as root: sudo $0" >&2
    exit 1
fi

set -exuo pipefail

install -m 0755 wg-healthcheck /usr/bin/wg-healthcheck
install -d -m 0755 /etc/wg-healthcheck
install -m 0600 config.example.env /etc/wg-healthcheck
install -m 0644 wg-healthcheck.service /etc/systemd/system
install -m 0644 wg-healthcheck.timer /etc/systemd/system

systemctl daemon-reload
