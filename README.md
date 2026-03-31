# setup-pi
Tweak the operating system ready or copying it over to an sd card for a raspberry pi. Only works with linux

Uses mounts, docker, chroot and qemu emulation to tweak your raspberry pi OS producing an image.

## Motivation
I got bored with mounting and settng up a device to get networking via rj-45 working after I had to upgrade a PI.  So I decided to automate parts of this.

Part of my motivation was a particularly nasty issue where the Pi would die immeidatley ater boot producing no logs with a certain wifi adaptor. The response from r/raspberrypi on reddit was of course "this is off topic and documented", it was not oftopic or documented.

## Alternatives and prior work
Raspios has an image builder. An LLM tells me that this works with a first bookt script. I do not like first book scripts because it can be difficult to debug (you need to reflash, insert into a pi, reboot, wait long enough for a boot, switch off the pi, remove the sd card, then mount)


## Installation
Install qemu and docker. Then install

```
pipx install setup-pi
```

## Usage
Create a toml file describing the image you want to generator.

You can use --sudoers to generate a sudoers rules to run without root.

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

Then run:

setup-raspios intial.img output.img --config config.toml



