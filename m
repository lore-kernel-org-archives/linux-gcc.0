From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Mistake With CPP File
Date: Fri, 2 Aug 2002 23:40:40 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20020802214040.GA12473@schiele.local>
References: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net> <20020801070932.GA30472@schiele.local> <3D48F387.24495315@cdm01.deedsmiscentral.net> <20020801133342.GA32311@schiele.local> <3D4A7F6D.3446C6F5@cdm01.deedsmiscentral.net> <20020802130820.GA10269@schiele.local> <3D4ACD09.A626D16@cdm01.deedsmiscentral.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D4ACD09.A626D16@cdm01.deedsmiscentral.net>
List-Id: <linux-gcc.vger.kernel.org>
To: deedsmis@aculink.net, linux-gcc@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2002 at 12:18:49PM -0600, SoloCDM wrote:
> Robert Schiele stated the following:
> >=20
> > On Fri, Aug 02, 2002 at 06:47:41AM -0600, SoloCDM wrote:
> >=20
> > > It starts the linking (ln command) with /usr/bin/g++ -->
> > > /etc/alternatives/g++ --> /usr/bin/colorg++ --> /usr/bin/colorgcc.
> > > G++ is acting as a link.  If executed in the same manner as g++ to
> > > create an a.out file, without options, colorgcc doesn't execute like
> > > g++.
> >=20
> > What do you have in ~/.colorgccrc?
>=20
> No such file exists.  Everything for g++ and gcc is exactly as it was
> installed.

Then your installation of colorgcc is braindead, as you have an
infinite loop, because colorgcc runs /usr/bin/g++ by default, which is
itself in your case.  You need to specify the path to your real g++ in
the config file.

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEVAwUBPUr8WMQAnns5HcHpAQFxZwf/c0B4TeTeJN7OXYCIfpk+uBDR0jwX0WfI
QM+EJMr7keoTQ0c3kSOVA653So/a/v941Ca4aHYhXuiFkAz6zT/Y5VB4Y/LOoYzj
CvgMYvZA5igsZpTPGz12c3CFjFhC0ZygEow8xwVkMVHrgldLURLOwg8icWVuI3wf
idOCUhXkCTQIGdNV2oFgxCR6DZ8ng40Q5hJAwVMYFcSypG2NDw0rdLBCMIcfxBhj
UP2x6rSj2qHaMpPJ8H5LYIKfy6kf5irSJClPl/3KlnWT6jMxsWeal3xdqke+Ax4m
LMbnu1Qh/nvHLNxTVbzp/bLceP0S35PADrNkfZ149VtSKYVOhErnxg==
=MpkT
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
