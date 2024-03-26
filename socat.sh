#!/usr/bin/env bash
set -e

HOST_IP=$(traceroute "8.8.8.8" | grep -v "8.8.8.8" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1)

echo "Starting socat over host IP: ${HOST_IP}"

IFS=','
for port in $LOCALHOST_PORTS; do
    socat "TCP-LISTEN:${port},fork" "TCP:${HOST_IP}:${port}"
done
