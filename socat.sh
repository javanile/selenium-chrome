#!/usr/bin/env bash
set -e

HOST_IP=$(traceroute "8.8.8.8" | grep -v "8.8.8.8" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1)

IFS=','
for port in $LOCALHOST_PORTS; do
  echo "Socat traffic to: ${HOST_IP}:${port}"
  socat "TCP-LISTEN:${port},fork" "TCP:${HOST_IP}:${port}" &
done

while true; do sleep 1; done
