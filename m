From: Robin Doer <robin@robind.de>
Subject: Re: Shared libraries: How to share global variaables?
Date: Sat, 30 Oct 2004 14:50:11 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <200410301450.15154.robin@robind.de>
References: <S263586AbUJ3FQs/20041030051648Z+543@vger.kernel.org> <e9ddb88e04102922207ce4eb04@mail.gmail.com> <e9ddb88e04102922215362c31b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4210696.fSV5X5Xvc9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <e9ddb88e04102922215362c31b@mail.gmail.com>
List-Id: <linux-gcc.vger.kernel.org>
To: Naga Raju <raj1234@gmail.com>
Cc: linux-gcc@vger.kernel.org

--nextPart4210696.fSV5X5Xvc9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Samstag, 30. Oktober 2004 07:21 schrieb Naga Raju:
> Is it possible to share global variables such that all applications
> which use shared libraries can see the changes made to the global
> variables by the other applications.
>
> I use gcc and compiled
>       gcc -shared -Wl,-soname,xyz.so.1 -o libxyz.so.1.0 -lxyz2  abc.o
>

Well, imho you can use the "extern" keyword.

See the following example:

bash-2.05b$ cat foo.c
const char* foo = "Hello World"; /* Global variable foo */

bash-2.05b$ cat bar.c
#include <stdio.h>

extern const char* foo;

int main(int argc, char* argv[]) {
  printf("%s\n", foo);

  return 0;
}

bash-2.05b$ gcc -shared -Wl,-soname,libfoo.so -o libfoo.so foo.c
bash-2.05b$ gcc -Wall bar.c -L. -lfoo -o bar
bash-2.05b$ ./bar
Hello World

> Regards,
> Nagaraju.

Bye,
Robin

--nextPart4210696.fSV5X5Xvc9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBg44HwnZkqspVX/oRAn72AJoD/ElUOoffJKOTHXTo3Qj7hwzABgCcDupB
EzSoPbmgvGkuReJiLU/YAnQ=
=TZ57
-----END PGP SIGNATURE-----

--nextPart4210696.fSV5X5Xvc9--
