## Synesthesia Autorunner

Note that ANY change to this script will invalidate Apple permissions, so you will need to save to a different script as an "Application" then give that + Synesthesia Accessibility permissions before ever running it. 

This will automatically run the script on start.


## Setup Ubuntu Autostart

In order for Ubuntu on iMac 2011 to autostart with power, we need this systemd script in its own startonpower.sh:
```sh
!#/bin/bash
sudo setpci -s 00:1f.0 0xA4.b=0
```

This was found via [this answer](https://superuser.com/questions/212434/how-to-reboot-after-power-failure-for-mac-mini-running-ubuntu) -- `lspci | grep LPC` giving `00:1f.0 ISA bridge: Intel Corporation HM77 Express Chipset LPC Controller (rev 04)`, then the datasheet saying the ports were the same. In this case, it's 00:1f.0.

Then we put this in `/etc/systemd/system/myscript.service`.
```
[Unit]
Description=My startup script

[Service]
ExecStart=/home/ubuntu/startonpower.sh

[Install]
WantedBy=multi-user.target
```

And start the service and enable it to run on boot:
```bash
sudo systemctl start myscript.service
sudo systemctl enable myscript.service
```

## Setup Script

Note that ANY change to this script will invalidate Apple permissions, so you will need to save to a different script as an "Application" then give that + Synesthesia Accessibility permissions before ever running it. Also add both to the start on startup list, and set the Mac power sleep delay to 3+ hours.

In addition, we changed the default screen from welcome to glob by dragging `glob.synScene` into `/resources/default`, and renaming it `welcome-scene.synScene`.