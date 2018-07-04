# SECURITY THROUGH OBSCURITY

## Text
Reading the contents of the screenshot you find that some guy named "John" created the firmware for the OffHub router and stored it on an iDropDrive cloud share. You fetch it and find "John" packed the firmware with an unknown key. Can you recover the package key?

## Attachments
A file with the name `password.x.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.p.o.n.m.l.k.j.i.h.g.f.e.d.c.b.a.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p`.

## Tools Used
* unzip
* unxz
* file
* bzip2
* gunzip
* fcrackzip

## Solution
This challenge, while quite easy, is tedious. The given file is a zip file containing a zip file, which contains another zip file. This continues until eventually the zip file you get contains an xz file, which contains more xz files recursively until you get a bz2 file. From there it goes to gz files and finally you get back to another zip file, except this time the zip file has a password on it. To deal with the tedium, I have written the following script:

```
#!/bin/bash

original_filename="password.x.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.p.o.n.m.l.k.j.i.h.g.f.e.d.c.b.a.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p"

cp $original_filename "new"

while true
do
        mv "new" "old" 2>/dev/null
        current_file_info=`file -b old`

        if grep --silent "Zip" <<< "$current_file_info"
        then
                unzip -q -o old -d tmp && mv tmp/* "new"
        fi

        if grep --silent "XZ" <<< "$current_file_info"
        then
                mv old old.xz
                unxz old.xz
        fi

        if grep --silent "bzip2" <<< "$current_file_info"
        then
                mv old old.bz2
                bzip2 -d old.bz2
        fi

        if grep --silent "gzip" <<< "$current_file_info"
        then
                mv old old.gz
                gunzip -d old.gz
        fi

        if grep --silent "ASCII" <<< "$current_file_info"
        then
                break
        fi
done

cat old

rm -d tmp
rm old
```

This should get you to the point where it prompts for a password for the final zip file. Once you enter the password, it will spit out the resultant flag.

In order to get the password of the zip file (`asdf`), you can use `fcrackzip` and feed it a dictionary.

The resulting flag is:
```
CTF{CompressionIsNotEncryption}
```
