From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: Why __memrchr vs. memrchr ?
Date: Tue, 3 Feb 2004 01:17:23 +0300
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040202221723.GD11571@basalt.office.altlinux.org>
References: <20040203023721.A20354@zzz.ward.six>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Return-path: <libc-alpha-return-14600-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20040203023721.A20354@zzz.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
To: libc-alpha@sources.redhat.com
Cc: linux-gcc@vger.kernel.org


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Feb 03, 2004 at 02:37:21AM +0500, Denis Zaitsev wrote:
> Why such a scheme is used in GLIBC:
> 
> declare + define __memrchr, and than
> 
> # ifdef __USE_GNU
> #  define memrchr(s, c, n) __memrchr ((s), (c), (n))
> # endif
> 
> ?  memrchr is not the GNU extension, is it?

According to memchr(3),
"The memrchr() function is a GNU extension, available since glibc 2.1.91".


-- 
ldv

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAHsxz9viEa8HiNCkRAkaMAJ9ZyxXWrgpVpMXu4qA192ae5nk2vQCeKQWY
e3snuwkVEpnWrtSIhz3XidY=
=pFuo
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
