From: John Richard Moser <nigelenki@comcast.net>
Subject: Generating shellcode at compile time
Date: Wed, 15 Dec 2004 22:55:15 -0500
Message-ID: <41C10723.5070604@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I need to generate some sort of strcpy()able shell code.  Probably
something to do

_exit(255);

would be quite enough; though more in-depth demonstrations would benefit
from being able to actually display a live exploit.  Something like
calling exec("/bin/bash") for example.

I'm working on an x86-64, but would like to be able to demonstrate
exploits and what PaX and the IBM stack smash protector do to stop them
on x86-64, x86, SPARC, PPC, SPARC64, and PPC64.

In the worst case, each shellcode could be individually created and
passed as a reaction to having the example daemon reveal the host type
(which may be useful in dual-host demonstrations where I could exploit a
PPC with an x86); however, I have not the time nor the need to invest my
time in generating such shellcode myself.

I'm not so sure what I want to do, but _exit(255) is fine for my
regression tests.

- --
All content of all messages exchanged herein are left in the
Public Domain, unless otherwise explicitly stated.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBwQcjhDd4aOud5P8RAl+vAJ40ThT0vaa3iyhCp/EgwsNhYp/8nQCfdVpU
Xv/XTZSogpCMgBI/j0mxqa8=
=5SD4
-----END PGP SIGNATURE-----
