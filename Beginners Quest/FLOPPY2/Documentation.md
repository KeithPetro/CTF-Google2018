# FLOPPY2

## Text
Looks like you found a way to open the file in the floppy! But that www.com file looks suspicious.. Dive in and take another look?

## Attachments
No attachments, using the `www.com` file from the previous FLOPPY challenge.

## Tools Used
* file
* cat
* Sublime Text

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

