#!/bin/bash

wakeonlan -i 192.168.178.255 00:11:32:C2:87:FF

echo "After successfull wake-up to mount run:"
echo "sudo mount -t nfs ds218play:/volume1/nas-data /path/to/mount/ds218play/"

