From: Ulrich Drepper <drepper@redhat.com>
Subject: Re: glibc 2.3
Date: Thu, 03 Oct 2002 09:22:37 -0700
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <3D9C6ECD.3050307@redhat.com>
References: <3D9C1775.9030503@redhat.com> <018901c26af7$7b78dce0$f6de11cc@black>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-9748-glibc-alpha=m.gmane.org@sources.redhat.com>
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

> It appears configure is using prefix /usr/local and spits out a bogus message.

THere is no bogus messages.  Installing in /usr/local does not overwrite
the system's libc and is safe from this perspective.  But gcc handles
/usr/local special which might lead to normal compilations picking the
headers up which might or might not lead to problems.  And /usr/local is
the default prefix because this is what it always is.

- -- 
- --------------.                        ,-.            444 Castro Street
Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
Red Hat         `--' drepper at redhat.com `---------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9nG7N2ijCOnn/RHQRAnSbAJ4/nvyFSjpqDjqjwWZvfCnXPt115wCbB473
FZtM68iPti/03fqC28vf5kk=
=UsED
-----END PGP SIGNATURE-----

