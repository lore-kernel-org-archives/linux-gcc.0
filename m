From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Mistake With CPP File
Date: Thu, 1 Aug 2002 09:09:33 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20020801070932.GA30472@schiele.local>
References: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net>
List-Id: <linux-gcc.vger.kernel.org>
To: deedsmis@aculink.net, linux-gcc@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2002 at 05:04:04AM -0600, SoloCDM wrote:
> Recently I tried to compile fig01_02.cpp with Kernel 2.2.20 on Linux
> Mandrake 8.0.  I used "gcc fig01_02.cpp" and received the following
> errors:
>=20
> <user_account>/tmp/ccmeDWKS.o: In function `main':
> <user_account>/tmp/ccmeDWKS.o(.text+0xf): undefined reference to
> `cout'
> <user_account>/tmp/ccmeDWKS.o(.text+0x14): undefined reference to
> `ostream::operator<<(char const *)'collect2: ld returned 1 exit status
>=20
> Why didn't it work?

cout is in libstdc++. So either you have to call "g++ fig01_02.cpp" or
"gcc -lstdc++ fig01_02.cpp".

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEVAwUBPUjerMQAnns5HcHpAQHpsQgAhIyoOBbQvnt3RifrVYCcfzQqlZ8R9EbV
Js5MkEVASgt7xj1EGrTonCd4uKDo+1pbcZZQaHzInEJwfQTSb6BOYbBu3JVdl73n
EjkKTe7YORvbUk6+iyq8nwEEiGLp4XpdHAhkpSov/iJHHHbNbOo/6a5LOgotWIlK
SHKf4C8xqFLkrtRUZLQ3/QOhdeyUphJ9/qjuM+QV07U/IMxCDVFzXqFp3ZDIq/LO
Sc0RopMsRE00R3OekomJEUa65Wd14Td1BYRhmFXfbRp1vZDWsxKrmWfcpw8gqp9j
OI1bN+8Qqj3JjqNWpyUFC8PNKQa4FndS71U965N0mE7NAaE1CWWNzQ==
=fr+q
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
