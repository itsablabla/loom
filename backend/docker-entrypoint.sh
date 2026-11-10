#!/bin/sh
# Openship: the named volume mounts root-owned; the app must run as appuser.
if [ "$(id -u)" = "0" ]; then
    mkdir -p /home/appuser/.local/share/loom
    chown -R appuser:appuser /home/appuser/.local
    exec su -s /bin/sh appuser -c 'exec "$@"' -- sh "$@"
fi
exec "$@"
