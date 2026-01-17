# Installing Arch Linux 2026

## Get The ISO
- Go to https://archlinux.org/download
- Verify checksums
- find USB on system
  - `lsblk`
  - look for something like sda
- `sudo dd bs=4M if=/path/to/arch.iso of=/dev/sda status=progress oflag=sync`
