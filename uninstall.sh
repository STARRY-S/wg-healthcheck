#!/bin/bash

cd $(dirname $0)

if [[ "$(id -u)" -ne 0 ]]; then
    echo "Please run as root: sudo $0" >&2
    exit 1
fi

set -exuo pipefail

rm /usr/bin/wg-healthcheck || true
rm -r /etc/wg-healthcheck || true

systemctl disable --now wg-healthcheck.timer || true

rm /etc/systemd/system/wg-healthcheck.service || true
rm /etc/systemd/system/wg-healthcheck.timer || true

systemctl daemon-reload
