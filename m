From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: compatible header functions
Date: Sat, 25 Jan 2003 14:25:34 +0100
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20030125132534.GA15289@schiele.local>
References: <20030125114402.25152.qmail@webmail29.rediffmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030125114402.25152.qmail@webmail29.rediffmail.com>
List-Id: <linux-gcc.vger.kernel.org>
To: n mishra <mishra_nn@rediffmail.com>
Cc: linux-gcc@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2003 at 11:44:02AM -0000, n  mishra wrote:
> Hi all!
> I am new to writing c programs in linux and I have trouble finding=20
> the following functions in the header files.

These are proprietary vendor extensions and not part of the C
standard.

> 1)itoa: to convert an integer to a string.
> 2)ltoa: to convert long integer to a string.

You can do the same with sprintf().

> 3)strset: to set the whole string to a given character.

Look up the function memset().

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iQEVAwUBPjKQTsQAnns5HcHpAQEwEggAhPjEAR/D7Pj16qQ6WGkpu7xoK4FVYWVQ
jek+wXygdMSsTExxz6eO5JAubnfUGkcXPWy5HWEk0jmQDr/eDql15py6UFTG8eig
MYEspheu9Byi8NAJzTwAygjWC1uyWoY3NwSAHcfxWYuMr1prZseyr+EEqPo+MZhU
VA/0ga14tangfVikBX02z9WCZshu6/TLz2AMig5davBCx5amDS1bbnIjydQv12m4
jw+z4vdsEhYqMuO1uG/So7+U73E89O4hbY48DzUfZAqSTMHNQpg8sFnsgpVlAtKO
THpWhxbHXwIixJJCbIMVEjIWWV+Dtrc74MR1RKGS9GeUS7C/AwSO7g==
=kLqw
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

