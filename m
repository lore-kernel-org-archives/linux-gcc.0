From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Mistake With CPP File
Date: Thu, 1 Aug 2002 15:33:42 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20020801133342.GA32311@schiele.local>
References: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net> <20020801070932.GA30472@schiele.local> <3D48F387.24495315@cdm01.deedsmiscentral.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D48F387.24495315@cdm01.deedsmiscentral.net>
List-Id: <linux-gcc.vger.kernel.org>
To: deedsmis@aculink.net, linux-gcc@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2002 at 02:38:32AM -0600, SoloCDM wrote:
> Robert Schiele stated the following:
> > cout is in libstdc++. So either you have to call "g++ fig01_02.cpp" or
> > "gcc -lstdc++ fig01_02.cpp".
>=20
> It worked -- Thanks!
>=20
> I couldn't help but notice how g++ linked all the way back to
> colorgcc.  Although, colorgcc doesn't react like g++.  Colorgcc won't
> create a.out.

Sorry, but I cannot see what you wanted to tell us with this
paragraph.

> What is gcc used for?  I noticed it seems to have some of the same
> files or libraries as g++.

gcc and g++ are the same, but gcc uses C as it's standard language,
where g++ uses C++ as standard language and links standard C++
libraries without the need to specify them explicitly.

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEVAwUBPUk4tcQAnns5HcHpAQGyuAf/d0zuR9NoY78saPQo6kpWNEh7edsyYayN
WmPG9XP2idi1Rq6/nLvkCmZAU/zF1sFZHI02L/mXBsH5P1oUwZuQx572fe8fr2y7
t3BwGEs5MgWe5dJ7klAXeWjjWUB2Q63hMx7TXBKwCQokAp8GQ+PCR/D5h41zC0Ko
E0Fm2BeKNReYNgLdtsaPMNThYVQXUuVBWYjL+l7zrwrpud+948e2mOVyNh3qeJK1
eaJBwTgfirqaR0kA7WCH5PA5S2nK12o6z1XtSA5SPRDZ13j5ty1xkIDze86++90A
BRiqpkbo6YEqbFGYy7FGrEzYFGm+KzCL+b/0GGaNroAltRLiKMFbhQ==
=1pmZ
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
