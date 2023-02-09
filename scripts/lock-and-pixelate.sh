#!/bin/bash

maim | convert -'[4%]' -sample 2500% /tmp/lockpixelate.png

i3lock -i /tmp/lockpixelate.png -n
