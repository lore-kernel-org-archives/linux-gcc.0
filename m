From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Shared libraries: How to share global variaables?
Date: Sat, 30 Oct 2004 16:45:23 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20041030144523.GC11105@lug-owl.de>
References: <S263586AbUJ3FQs/20041030051648Z+543@vger.kernel.org> <e9ddb88e04102922207ce4eb04@mail.gmail.com> <e9ddb88e04102922215362c31b@mail.gmail.com> <200410301450.15154.robin@robind.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3cI6DWK3Xt33P8nt"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200410301450.15154.robin@robind.de>
List-Id: <linux-gcc.vger.kernel.org>
To: linux-gcc@vger.kernel.org


--3cI6DWK3Xt33P8nt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-10-30 14:50:11 +0200, Robin Doer <robin@robind.de>
wrote in message <200410301450.15154.robin@robind.de>:
> Am Samstag, 30. Oktober 2004 07:21 schrieb Naga Raju:
> > Is it possible to share global variables such that all applications
> > which use shared libraries can see the changes made to the global
> > variables by the other applications.
>=20
> Well, imho you can use the "extern" keyword.
> See the following example:
> bash-2.05b$ cat foo.c
> const char* foo =3D "Hello World"; /* Global variable foo */
>=20
> bash-2.05b$ cat bar.c
> #include <stdio.h>
>=20
> extern const char* foo;
>=20
> int main(int argc, char* argv[]) {
>   printf("%s\n", foo);
>=20
>   return 0;
> }
>=20
> bash-2.05b$ gcc -shared -Wl,-soname,libfoo.so -o libfoo.so foo.c
> bash-2.05b$ gcc -Wall bar.c -L. -lfoo -o bar
> bash-2.05b$ ./bar
> Hello World

As stated, the initial author had something different in mind: to have
two programs linking one common shared library in a way that one program
(in it's VM space) changes a (common to both programs) variable and
automagically, this variable also changes in the 2nd program.

Actually, early Windows versions had something like that.

It's possibly to achieve this by some hacks, but I won't tell you how to
do that--it's evil.

Just use shared memory; asking Google for "linux programming shared
memory" will give you some examples and book tips.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--3cI6DWK3Xt33P8nt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBg6kDHb1edYOZ4bsRAnsAAJ48CfEpN16FEjG57vfboM7yDixZagCgj6bn
a5ublF0WiXvkkORU+OnQGaY=
=0hiT
-----END PGP SIGNATURE-----

--3cI6DWK3Xt33P8nt--
