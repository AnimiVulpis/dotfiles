#!/bin/bash

echo 'cp -pfv ~/.local/share/buku/* ~/rclone/'
cp -pfv ~/.local/share/buku/* ~/rclone/

echo 'rclone --progress --human-readable -v bisync ~/rclone/ gdrive:rclone/'
rclone --progress --human-readable -v bisync ~/rclone/ gdrive:rclone/
