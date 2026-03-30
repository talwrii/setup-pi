# setup-pi
Tweak the operating system ready or copying it over to an sd card for a raspberry pi

Uses mounts and chroot to tweak your raspberry pi OS.

## Motivation
I got bored with mounting and settng up a device to get networking via rj-45 working after I had to upgrade a PI.  So I decided to automate parts of this.

Part of my motivation was a particularly nasty issue where the Pi would die immeidatley ater boot producing no logs with a certain wifi adaptor. The response from r/raspberrypi on reddit was of course "this is off topic and documented", it was not oftopic or documented.

## Alternatives and prior work
Raspios has an image builder.






## Installation
pipx install setup-pi


## Usage
Create a toml file describing the image you want to generator.

```
hostname  = "electric-pi"
persistent_logging = true
backdoor = true

first_boot_cmd = "/listen"

# Ethernet - set eth_dhcp = false for static
eth_dhcp  = true
# eth_ip      = "192.168.0.2"
# eth_netmask = "255.255.255.0"
# eth_gateway = "192.168.0.1"  # optional even for static

# WiFi - set wifi = true to configure
wifi      = true
wifi_ssid   = "wif"
wifi_pass   = "XXXXXXXXXX" 
# wifi_dhcp   = true
# wlan0_ip    = "192.168.3.200"
# wifi_netmask = "255.255.255.0"
# wifi_gateway = "192.168.3.1"

packages = ["ncat"]


[[users]]
name = "bruger"
sudo = true
ssh_keys = ["~/.ssh/id_rsa.pub"]

[[files]]
src = "listen"
dst = "/listen"
mode = "0755"

# [[users]]
# name = "guest"
# sudo = false
# password = "letmein"
```

./setup-raspios intial.img output.img --config config.toml



