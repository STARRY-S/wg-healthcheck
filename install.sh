#!/bin/bash

cd $(dirname $0)

if [[ "$(id -u)" -ne 0 ]]; then
    echo "Please run as root: sudo $0" >&2
    exit 1
fi

INSTALL_DIR=${INSTALL_DIR:-}
SYSTEMD_DIR=${SYSTEMD_DIR:-"/etc/systemd/system"}

set -exuo pipefail

install -Dm0755 wg-healthcheck ${INSTALL_DIR}/usr/bin/wg-healthcheck
install -Dm0600 config.example.env ${INSTALL_DIR}/etc/wg-healthcheck/config.example.env
install -Dm0644 wg-healthcheck.service ${INSTALL_DIR}${SYSTEMD_DIR}/wg-healthcheck.service
install -Dm0644 wg-healthcheck.timer ${INSTALL_DIR}${SYSTEMD_DIR}/wg-healthcheck.timer
