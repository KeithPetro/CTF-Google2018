# GATEKEEPER

## Text
It's a media PC! All fully purchased through the online subscription revolution empire "GimmeDa$". The PC has a remote control service running that looks like it'll cause all kinds of problems or that was written by someone who watched too many 1990s movies. You download the binary from the vendor and begin reversing it. Nothing is the right way around.
## Attachments
A file called `gatekeeper`, which is an ELF 64 executable.

## Tools Used
* file
* ltrace

## Solution
Running `file` to find out what kind of file we have provides us with:
```
$ file gatekeeper
gatekeeper: ELF 64-bit LSB  shared object, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=a89e770cbffa17111e4fddb346215ca04e794af2, not stripped
```

From here, running the executable provides us with the usage:
```
$ ./gatekeeper
/===========================================================================\
|               Gatekeeper - Access your PC from everywhere!                |
+===========================================================================+
[ERROR] Login information missing
Usage: ./gatekeeper <username> <password>
```

Assuming the program does extremely rudimentary authentication using strcmp, we can use ltrace to find what the username and password are compared to:
```
$ ltrace -e strcmp ./gatekeeper user pass
/===========================================================================\
|               Gatekeeper - Access your PC from everywhere!                |
+===========================================================================+
 ~> Verifying...gatekeeper->strcmp("user", "0n3_W4rM")                                                                         = 69
.
ACCESS DENIED
 ~> Incorrect username
+++ exited (status 1) +++
```

As we can see, our username is being compared to `0n3_W4rM`, suggesting this is the correct username. Modifying our command slightly:
```
$ ltrace -e strcmp ./gatekeeper 0n3_W4rM pass
/===========================================================================\
|               Gatekeeper - Access your PC from everywhere!                |
+===========================================================================+
 ~> Verifying...gatekeeper->strcmp("0n3_W4rM", "0n3_W4rM")                                                                     = 0
...gatekeeper->strcmp("ssap", "zLl1ks_d4m_T0g_I")                                                                 = -7
.ACCESS DENIED
 ~> Incorrect password
+++ exited (status 0) +++
```

Now we can see that our password is being compared to `zLl1ks_d4m_T0g_I`. However, we must also note that our password is being compared in reverse. Because of this, the actual password should be `I_g0T_m4d_sk1lLz`.

Putting this information in gives us:
$ ./gatekeeper 0n3_W4rM I_g0T_m4d_sk1lLz
/===========================================================================\
|               Gatekeeper - Access your PC from everywhere!                |
+===========================================================================+
 ~> Verifying.......Correct!
Welcome back!
CTF{I_g0T_m4d_sk1lLz}
```

This gives us the flag:
```
CTF{I_g0T_m4d_sk1lLz}
```
