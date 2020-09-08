#! /bin/sh -e

while inotifywait -e delete /run/user/0/wayland-0; do
    snapctl restart "$SNAP_NAME".browser
done
