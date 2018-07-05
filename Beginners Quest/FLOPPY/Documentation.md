# FLOPPY

## Text
Using the credentials from the letter, you logged in to the Foobanizer9000-PC. It has a floppy drive...why? There is an .ico file on the disk, but it doesn't smell right..

## Attachments
An .ico file.

## Tools Used
* cat
* unzip

## Solution
The first thing I did was take a quick look at the contents of foo.ico using `cat`, resulting in a bunch of garbage with one thing within it that I found interesting, `driver.txt`.

On a hunch, I tried extracting the file using `unzip`, and I was provided with a file called `www.com` and another called `driver.txt`. The flag was contained within `driver.txt`:
```
CTF{qeY80sU6Ktko8BJW}
```
