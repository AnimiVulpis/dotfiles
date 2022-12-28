#!/bin/bash

echo 'cp -fv ~/.local/share/buku/* ~/rclone/'
cp -fv ~/.local/share/buku/* ~/rclone/

echo 'rclone --progress --human-readable -v bisync ~/todotxt/ gdrive:todotxt/'
rclone --progress --human-readable -v bisync ~/todotxt/ gdrive:todotxt/

echo 'rclone --progress --human-readable -v bisync ~/rclone/ gdrive:rclone/'
rclone --progress --human-readable -v bisync ~/rclone/ gdrive:rclone/
