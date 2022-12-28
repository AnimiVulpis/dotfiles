# General information

All files in the `etc/` folder belong into their respective paths under `/etc/`

## systemd related

### fwupdmgr problems

In order to debug `fwupdmgr refresh` failing I use a [systemd drop-in file](https://wiki.archlinux.org/index.php/Systemd#Drop-in_files)

In order to add the verbose flag use `sudo systemctl edit fwupd.service`.
After successful editing the file `/etc/systemd/system/fwupd.service.d/override.conf` should look like this:

```properties
# AnimiVulpis: Add verbose flag to fwupd
[Service]
ExecStart=
ExecStart=/usr/lib/fwupd/fwupd -v
```
