From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: build
Date: Wed, 5 May 2004 16:15:18 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20040505141518.GJ29503@lug-owl.de>
References: <018401c432a8$bc7fc080$630210ac@dominc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IqkiyIW+g96++y1l"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <018401c432a8$bc7fc080$630210ac@dominc>
List-Id: <linux-gcc.vger.kernel.org>
To: Dominic VP <dominic.vp@globaledgesoft.com>
Cc: linux-gcc@vger.kernel.org


--IqkiyIW+g96++y1l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-05-05 19:26:17 +0530, Dominic VP <dominic.vp@globaledgesoft.co=
m>
wrote in message <018401c432a8$bc7fc080$630210ac@dominc>:
> I am having to port linux to a new architecture. This architecture does n=
ot
> have gcc ported on to it. This does have an ansi c compiler/as/ld.

Well, the Linux kernel highly depends on some GCC extensions, so you'll
need to make gcc work for your architecture (btw., what arch are you
working on?).

With a lot of luck, Intels compiler (icc) may also produce a working
kernel image, but it'll probably only work for ia32 and ia64 :)

> Has anyone has had any experience/success with building linux with an ans=
i c
> compiler. I know it does not build automagically, but any info on
> deviations/changes/tools would be appreciated a LOT.

You'd need to work around a lot of gccisms for the Linux kernel. ...and
GNU userland may not easily build with other compilers, too...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--IqkiyIW+g96++y1l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAmPb2Hb1edYOZ4bsRApC7AJ9U1999aJ1B+7ocIf0cTohbo8BD0QCeNFyM
qPd5QoIrGTJdz6nRL3v+FAo=
=5b2W
-----END PGP SIGNATURE-----

--IqkiyIW+g96++y1l--
