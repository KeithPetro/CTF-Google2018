# FIRMWARE

## Text
After unpacking the firmware archive, you now have a binary in which to go hunting. Its now time to walk around the firmware and see if you can find anything.

## Attachments
A `.ext4.gz` file containing an `.ext4` filesystem file.

## Tools Used
* mkdir
* mount
* ls
* gunzip
* cat

## Solution
After extracting the `challenge2.ext4` file, I mounted the filesystem:
```
mkdir /mnt/extsys
mount -o loop /path/to/data /mnt/extsys
```

Navigating to this directory gives me the following directory listing:
```
bin
boot
dev
etc
home
lib
lib64
lost+found
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
```

Running `ls` with the `-a` option provides us with the hidden file `.mediapc_backdoor_password.gz`.

Running `gunzip` allows us to extract the file, leaving us with `.mediapc_backdoor_password`.

`cat`ing this file gives us:
```
CTF{I_kn0W_tH15_Fs}
```
