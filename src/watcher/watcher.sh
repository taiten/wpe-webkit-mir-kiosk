#! /bin/sh -e

while test ! -e /run/user/0/wayland-0; do
    echo "Wayland socket not available, waiting one second"
    sleep 1
done

inotifywait --event delete --format '%f' /run/user/0 | while IFS=' ' read -r file; do
    if test "$file" = "wayland-0"; then
        echo "Wayland socket was deleted, restarting browser service in 2 seconds"
        sleep 2
        snapctl restart "$SNAP_NAME".browser
    fi
done
