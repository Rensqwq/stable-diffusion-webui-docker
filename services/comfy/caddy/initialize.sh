#!/bin/bash
source /etc/profile

mkdir -p /var/log/jcjy/

/docker/entrypoint.sh > /var/log/jcjy/comfyui-entrypoint.log 2>&1 &

python -u main.py --listen --port 8080 > /var/log/jcjy/comfyui.log 2>&1 &

caddy start

tail -f /dev/null