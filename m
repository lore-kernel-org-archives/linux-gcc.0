From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Are string literals _always_ allocated in the RO section?
Date: Mon, 17 Jan 2005 18:18:53 +0100
Message-ID: <20050117171853.GG28037@lug-owl.de>
References: <20050116022247.A3066@natasha.ward.six> <m3brbq1dtv.fsf@uniton.integrable-solutions.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jk/5KjyVsvxWSMIA"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m3brbq1dtv.fsf@uniton.integrable-solutions.net>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
To: linux-gcc@vger.kernel.org


--jk/5KjyVsvxWSMIA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2005-01-16 00:18:20 +0100, Gabriel Dos Reis <gdr@integrable-solutio=
ns.net>
wrote in message <m3brbq1dtv.fsf@uniton.integrable-solutions.net>:
> Denis Zaitsev <zzz@anda.ru> writes:
>=20
> | This program:
> |=20
> | void x(char *s)
> | {
> |     *s=3D 'x';
> | }
> |=20
> | main()
> | {
> |     x("y");
> | }

> | not <const char*> does nothing in this case.  Should it be considered
> | as a bug?
>=20
> In the program? Yes.

Maybe you'd tell him more about the magic :)

char *mytext =3D "hello";

results in a pointer (which you may later on make pointing to a
different location) that points to a static, read-only string containing
"hello\0". However, if you need to change the text, you need to do it
like this:

char mytext[] =3D "hello";

Cf. section 6.4.5.6 of the C99 standard.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--jk/5KjyVsvxWSMIA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB6/N9Hb1edYOZ4bsRAlauAJ9XtSSleihH5ZDpy9dp3hlXJGNuVwCfSRej
az2UwUdGYExvYgA99nv7DLQ=
=AXV3
-----END PGP SIGNATURE-----

--jk/5KjyVsvxWSMIA--
