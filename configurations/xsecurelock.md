# xsecurelock configuration explanation

## cli invocation

```
env \
XSECURELOCK_AUTH_TIMEOUT=60 \
XSECURELOCK_BLANK_TIMEOUT=120 \
XSECURELOCK_BLANK_DPMS_STATE=standby \
XSECURELOCK_BURNIN_MITIGATION=500 \
XSECURELOCK_PASSWORD_PROMPT=cursor \
XSECURELOCK_SAVER=saver_blank \
xsecurelock
```

## List of options with explanation

* `XSECURELOCK_AUTH_TIMEOUT` time in seconds till auth dialog turns off again
* `XSECURELOCK_BLANK_TIMEOUT` time in seconds till windows blanking (not sure what that means)
* `XSECURELOCK_BLANK_DPMS_STATE` I guess that tells xsecure lock how to blank the screen
* `XSECURELOCK_BURNIN_MITIGATION` specifies the number of pixels the prompt of auth_x11 may be moved at startup to mitigate possible burn-in effects
* `XSECURELOCK_DATETIME_FORMAT` the date format to show. Defaults to the locale settings
* `XSECURELOCK_PASSWORD_PROMPT` Choose password prompt mode
* `XSECURELOCK_SAVER` specifies the desired screen saver module

## List of all options

Can be found [here](https://github.com/google/xsecurelock#options)
