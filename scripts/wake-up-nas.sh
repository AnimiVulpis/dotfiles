#!/bin/bash

echo "wakeonlan -i <ip> <mac-address>"
echo "Example:"
echo "wakeonlan -i 192.168.178.255 00:11:22:33:44:55"
echo
echo "After successfull wake-up run the following to mount:"
echo "sudo mount -t nfs <name>:<remote-path/to-mount> <local-path/to-mount-to/"
echo "sudo mount -t nfs nas:/volume1/nas-data /path/to/mount/nas/"
