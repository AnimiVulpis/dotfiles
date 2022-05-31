#!/bin/bash

wakeonlan -i 192.168.178.255 00:11:22:33:44:55

echo "After successfull wake-up to mount run:"
echo "sudo mount -t nfs nas:/volume1/nas-data /path/to/mount/nas/"

