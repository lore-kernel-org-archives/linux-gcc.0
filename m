From: Ulrich Drepper <drepper@redhat.com>
Subject: glibc 2.3.1
Date: Thu, 10 Oct 2002 23:40:10 -0700
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <3DA6724A.2030705@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-9890-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: GNU libc devel <libc-alpha@sources.redhat.com>, linux-gcc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I've uploaded

  glibc-2.3.1.tar.bz2
  glibc-2.3-2.3.1.diff.bz2
  glibc-2.3.1pre2-2.3.1.diff.bz2
  glibc-linuxthreads-2.3.1.tar.bz2

to

  ftp://sources.redhat.com/pub/glibc/releases/

The files will soon also be available at

  ftp://ftp.gnu.org/pub/gnu/glibc/

and the mirrors worldwide.


This releases is mainly meant to introduce some changes which work
around problems some programs have which use very small stack sizes and
still expect all libc functions to be usable.  Beside this change only
very few, mostly non-code, changes are included.  Every user of glibc
2.3 should upgrade.

As usual, compiling glibc is nothing for the faint hearted.  It is
complicated and demanding and can potentially ruin your entire
installation.  Better wait for your distribution maker to provide you
with binaries.  People  who nevertheless compile glibc on their own have
to read the documentation, FAQ, and the announcement for the 2.3 release:

  http://sources.redhat.com/ml/libc-alpha/2002-10/msg00048.html

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9pnJO2ijCOnn/RHQRAuYNAJ4+0tsi9Iq55RB7iPpndhnSTPFB1QCfZD8y
l14J4/l63KWOZbwKG375hTs=
=YIW3
-----END PGP SIGNATURE-----

