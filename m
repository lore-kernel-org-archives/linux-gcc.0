From: Ulrich Drepper <drepper@redhat.com>
Subject: Re: glibc 2.3
Date: Thu, 03 Oct 2002 09:33:22 -0700
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <3D9C7152.4090203@redhat.com>
References: <3D9C1775.9030503@redhat.com> <018901c26af7$7b78dce0$f6de11cc@black> <3D9C6ECD.3050307@redhat.com> <01db01c26af9$9d9bf580$f6de11cc@black>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-9752-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Black <mblack@csi-inc.com>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Black wrote:
> But configure says NOT to install in /usr/local
> FAQ says TO install in /usr/local
> Which is it?  Or am I supposed to pick something other than /usr/ or /usr/local now?

It depends on what you want.  Using a prefix other than /usr and
/usr/local avoids both problems.

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9nHFS2ijCOnn/RHQRAj/eAKCcaX4XZRB951Qsi3FMDKbxLxxemgCfeGU/
J9tUsrW3r9gAa5ZzfTXNLQ0=
=8wHh
-----END PGP SIGNATURE-----

