From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Syntax Code Compiled Incorrectly
Date: Thu, 12 Sep 2002 18:21:50 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20020912162150.GA30173@schiele.local>
References: <3D7F9C03.9E261B40@cdm01.deedsmiscentral.net> <005a01c25a50$2741c360$f6de11cc@black>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <005a01c25a50$2741c360$f6de11cc@black>
List-Id: <linux-gcc.vger.kernel.org>
To: Mike Black <mblack@csi-inc.com>
Cc: deedsmis@aculink.net, linux-gcc@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2002 at 07:33:01AM -0400, Mike Black wrote:
> I can tell you that your program does not compile on gcc 2.95.3
> But it does compile on gcc 3.1
> I tried checking gcc.gnu.org but my queries would never finish.
> I suspect it was a bug that has been fixed.  A google search shows others=
 with the same problem up to gcc 3.0.

That's partially correct. It is not a bug in the compiler, but this
variant of the compare() method was not implemented in the STL shipped
with older gccs.

To fix that you have to upgrade your STL. I don't know, if current STL
works with older compilers, so it might be necessary to upgrade the
compiler too.

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEVAwUBPYC/HsQAnns5HcHpAQGOYQgAgD4y+HLzjCqBuaUZpjiXBmvEXM/VdEGn
rJbREZrnTTLAHOrOmwrhes5Gt8T/o2HpmW0IGSFvUlKaPtJ6aX1mkuykVlelMdPl
PdgbOKWieE5qHpJ6sDw6w7+JT9UdX0gura0U4Za/EOkqwF+XreDA9xaPCmT2hwLj
akuNYyNVuzHmTjSZXtSXdwKOwi+4vZJWaSEST8e1AxGhsZS7/okiQ2aj6pHnireg
nSj7bBXa74mxAhSUgRkFMeSSppZh7SAPDuXg/N9NVs75SxQu/X5J8AU5qZaRZjFW
6r95UzYek0vCmOJHIU7aB8d1P2Y/TRaMGja8A8W0qgSBh2CjKC2UqQ==
=hofh
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
