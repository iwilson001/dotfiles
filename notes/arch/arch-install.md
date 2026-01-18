# Installing Arch Linux 2026

## Get The ISO
- Go to https://archlinux.org/download
- Verify checksums
- find USB on system
  - `lsblk`
  - look for something like sda
- `sudo dd bs=4M if=/path/to/arch.iso of=/dev/sda status=progress oflag=sync`

## Install Arch
- This works for thinkpad P15v
- On boot spam F12 to get to boot menu and select the name of the USB we just installed the iso on to
- wipe existing drives
- connect to internet
  - `iwctl`
  - `device list`
  - `station wlan0 connect 'WIFI NAME'`
  - `station wlan0 show`
  - `exit`
- `archinstall`
- file system 
  - btrfs with compression
  - CoW only good for specific use cases
- encryption
  - LVM on LUKS
    - simple, full disk encryption
  - LUKS on LVM
    - more complicated, specific partition encryption