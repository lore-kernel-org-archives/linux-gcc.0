From: Andreas Jaeger <aj@suse.de>
Subject: Re: Why __memrchr vs. memrchr ?
Date: Tue, 03 Feb 2004 07:03:40 +0100
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <m3ektcsnr7.fsf@gromit.moeb>
References: <20040203023721.A20354@zzz.ward.six>
	<20040202221723.GD11571@basalt.office.altlinux.org>
	<20040203053002.A21975@zzz.ward.six>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <libc-alpha-return-14602-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20040203053002.A21975@zzz.ward.six> (Denis Zaitsev's message
 of "Tue, 3 Feb 2004 05:30:02 +0500")
List-Id: <linux-gcc.vger.kernel.org>
To: libc-alpha@sources.redhat.com
Cc: linux-gcc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Denis Zaitsev <zzz@anda.ru> writes:

> On Tue, Feb 03, 2004 at 01:17:23AM +0300, Dmitry V. Levin wrote:
>> Hi,
>>=20
>> On Tue, Feb 03, 2004 at 02:37:21AM +0500, Denis Zaitsev wrote:
>> > Why such a scheme is used in GLIBC:
>> >=20
>> > declare + define __memrchr, and than
>> >=20
>> > # ifdef __USE_GNU
>> > #  define memrchr(s, c, n) __memrchr ((s), (c), (n))
>> > # endif
>> >=20
>> > ?  memrchr is not the GNU extension, is it?
>>=20
>> According to memchr(3),
>> "The memrchr() function is a GNU extension, available since glibc 2.1.91=
".
>
> Oh, I'm sorry.  This fact is omited from the texinfo GLIBC
> documentation...

It's in the Library Summary:
`void * memrchr (const void *BLOCK, int C, size_t SIZE)'
     `string.h' (GNU):  *Note Search Functions::.


Andreas
=2D-=20
 Andreas Jaeger, aj@suse.de, http://www.suse.de/~aj
  SuSE Linux AG, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
   GPG fingerprint =3D 93A3 365E CE47 B889 DF7F  FED1 389A 563C C272 A126

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAHzm8OJpWPMJyoSYRAkklAJ4+CXEYF80TEKHuSP8uRD6cH+w88wCcCgxD
u8XEYDmq8cWEJUqENSUrq4E=
=WJwl
-----END PGP SIGNATURE-----
--=-=-=--
