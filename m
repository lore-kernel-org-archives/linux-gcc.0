From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: Why __memrchr vs. memrchr ?
Date: Fri, 6 Feb 2004 05:08:09 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040206050809.A12373@zzz.ward.six>
References: <20040203023721.A20354@zzz.ward.six> <20040202221723.GD11571@basalt.office.altlinux.org> <20040203053002.A21975@zzz.ward.six> <m3ektcsnr7.fsf@gromit.moeb>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14628-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <m3ektcsnr7.fsf@gromit.moeb>; from aj@suse.de on Tue, Feb 03, 2004 at 07:03:40AM +0100
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Tue, Feb 03, 2004 at 07:03:40AM +0100, Andreas Jaeger wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> > On Tue, Feb 03, 2004 at 01:17:23AM +0300, Dmitry V. Levin wrote:
> >> 
> >> According to memchr(3),
> >> "The memrchr() function is a GNU extension, available since glibc 2.1.91".
> >
> > Oh, I'm sorry.  This fact is omited from the texinfo GLIBC
> > documentation...
> 
> It's in the Library Summary:
> `void * memrchr (const void *BLOCK, int C, size_t SIZE)'
>      `string.h' (GNU):  *Note Search Functions::.

Indeed, it's shortly marked as (GNU) here and there.  But that's not
described in the texi manual.  So, below is the tiny patch.  Please,
apply it.


--- manual/string.texi.orig	2004-02-06 05:02:13.000000000 +0500
+++ manual/string.texi	2004-02-06 05:03:47.000000000 +0500
@@ -1625,6 +1625,8 @@ This function is a GNU extension.
 The function @code{memrchr} is like @code{memchr}, except that it searches
 backwards from the end of the block defined by @var{block} and @var{size}
 (instead of forwards from the front).
+
+This function is a GNU extension.
 @end deftypefun
 
 @comment string.h
