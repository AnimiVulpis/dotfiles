# General information

All files in the `etc/` folder belong into their respective paths under `/etc/`

# systemd related

## fwupdmgr problems

In order to debug `fwupdmgr refresh` failing I use a [systemd drop-in file](https://wiki.archlinux.org/index.php/Systemd#Drop-in_files)

In order to add the verbose flag use `sudo systemctl edit fwupd.service`.
After successful editing the file `/etc/systemd/system/fwupd.service.d/override.conf` should look like this:
```
# AnimiVulpis: Add verbose flag to fwupd
[Service]
ExecStart=
ExecStart=/usr/lib/fwupd/fwupd -v
```

# xsecurelock configuration explanation

## xsecurelock start command

    env \
    XSECURELOCK_AUTH=auth_x11 \
    XSECURELOCK_AUTHPROTO=authproto_pam \
    XSECURELOCK_AUTH_TIMEOUT=60 \
    XSECURELOCK_BLANK_TIMEOUT=10 \
    XSECURELOCK_BLANK_DPMS_STATE=off \
    XSECURELOCK_BURNIN_MITIGATION=500 \
    XSECURELOCK_DATETIME_FORMAT='%Y-%m-%d %T' \
    XSECURELOCK_FONT='Iosevka Medium Extended' \
    XSECURELOCK_PASSWORD_PROMPT=cursor \
    XSECURELOCK_SAVER=saver_blank \
    XSECURELOCK_SHOW_DATETIME=1 \
    XSECURELOCK_SHOW_HOSTNAME=1 \
    xsecurelock

## List of options with explanation found [here](https://github.com/google/xsecurelock#options)

* `XSECURELOCK_AUTH=auth_x11` explicitely set default auth module
* `XSECURELOCK_AUTHPROTO=authproto_pam` explicitely set default auth protocol module
* `XSECURELOCK_AUTH_TIMEOUT=60` time in seconds till auth dialog turns off again
* `XSECURELOCK_BLANK_TIMEOUT=10` time in seconds till windows blanking (not sure what that means)
* `XSECURELOCK_BLANK_DPMS_STATE=off` I guess that tells xsecure lock how to blank the screen
* `XSECURELOCK_BURNIN_MITIGATION=500` specifies the number of pixels the prompt of auth_x11 will move to mitigate possible burn-in effects
* `XSECURELOCK_DATETIME_FORMAT='%Y-%m-%d %T'` the date format to show. Defaults to the locale settings
* `XSECURELOCK_FONT='Iosevka Medium Extended'` the font to use on the lock screen
* `XSECURELOCK_PASSWORD_PROMPT=cursor` Choose password prompt mode
* `XSECURELOCK_SAVER=saver_blank` explicitely set the default screen saver module
* `XSECURELOCK_SHOW_DATETIME=1` show datetime
* `XSECURELOCK_SHOW_HOSTNAME=1` show host
