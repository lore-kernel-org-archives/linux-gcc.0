From: Ulrich Drepper <drepper@redhat.com>
Subject: Re: glibc 2.3.1: fix for the i386 inline strings code
Date: Tue, 14 Jan 2003 06:43:41 +0000
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <3E23B19D.90708@redhat.com>
References: <20030106063048.A32392@natasha.zzz.zzz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-11006-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20030106063048.A32392@natasha.zzz.zzz>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Zaitsev <zzz@cd-club.ru>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Denis Zaitsev wrote:

> This is a trivial patch for the inlined i386 strings' header.  Without
> it, say, X11 can't be compiled with -D__USE_STRING_INLINES - a
> problems will be caused by XtNewString and X11's own bzero.  These
> problems are cured by the first and the second chunks of the patch,
> correspondingly.

I've applied the patch after correcting the type used in the casts.  Thanks,

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+I7Gd2ijCOnn/RHQRAsVBAJ956F4GTF/fv1RpbU9nImKsPvgfxwCghrPN
UWiP7thvgVDX78LkRQleBks=
=V2JO
-----END PGP SIGNATURE-----

