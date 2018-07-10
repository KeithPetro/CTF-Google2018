# FLOPPY2

## Text
Looks like you found a way to open the file in the floppy! But that www.com file looks suspicious.. Dive in and take another look?

## Attachments
No attachments, using the `www.com` file from the previous FLOPPY challenge.

## Tools Used
* file
* cat
* Sublime Text
* DOSBOX
* type (DOS)

## Solution
Checking the file information:
```
$ file www.com
```

This provides us with the following information, telling us that the file is simply text:
```
www.com: ASCII text, with CR, LF line terminators
```

Checking the contents of the file:
```
$ cat www.com
```

This provides us with the following content:
```
The Foobanizer9000 is no longer on the OffHub DMZ.          $)I!hSLX4SI!{p*S:eTM'~_?o?V;m;CgAA]Ud)HO;{ l{}9l>jLLP[-`|0gvPY0onQ0geZ0wY5>D0g]h+(X-k&4`P[0/,64"P4APG
```

This file, however, uses CRLF line terminators, and thus `cat` will not properly format the text. Opening the file in Sublime Text gives us:
```
hD7X-t6ug_hl(]Wh8$^15GG1-hbrX5prPYGW^QFIuxYGFK,1-FGIuqZhHIX%A)I!hSLX4SI!{p*S:eTM'~_?o?V;m;CgAA]Ud)HO;{ l{}9l>jLLP[-`|0gvPY0onQ0geZ0wY5>D0g]h+(X-k&4`P[0/,64"P4APG
The Foobanizer9000 is no longer on the OffHub DMZ.          $
```

Since it appears this effort is fruitless, I moved on looking into running `www.com`. `COM` files were a common executable format on DOS, so I tried running it in DOSBOX, but all I got was:
```
The Foobanizer9000 is no longer on the OffHub DMZ.
```

At least, that is what the terminal displays to us. There are various different characters which can be used to do some rudimentary text formatting in the DOS terminal, thus potentially hiding some of the standard output.

In order to get all of the standard output, I redirected the output of `www.com` to a textfile:
```
www.com > www.txt
```

In the resulting `www.txt`, I obtained the following:
```
CTF{g00do1dDOS-FTW}



II4\
p5KW=
)P[-`|0gvPY0onQ0geZ0wY5>D0g]h+(X-k&4`P[0/,64"P4APÃ
The Foobanizer9000 is no longer on the OffHub DMZ.          
```

You'll notice that there are a few _interesting_ characters there that are displaying in a bit of an odd way. These characters are (in order):
* SO - Shift-Out (0x0E)
* DEL - Delete (0x7F)
* DC2 - Device Control 2 (0x12)
* SO - Shift-Out (0x0E)
* SYN - Synchronous Idle (0x16)

These are all non-printing ASCII characters, meaning that their function was not to be seen by us, but rather to indicate what should be done to the computer. These characters appear to be affecting the way that the text is being formatted when printed to standard output in DOSBOX. This can be seen further through trying to use the `type` command to print the contents of `www.txt`, as it provides us with the _exact_ same output as running `www.com`, despite the fact that (as we know) the file contains more text than just that. It would be interesting to investigate what exactly these particular characters are doing the to the formatting of the output in DOS.

The flag can be found in `www.txt` after redirecting the output of `www.com` to it:
```
CTF{g00do1dDOS-FTW}
```
