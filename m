From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: Why __memrchr vs. memrchr ?
Date: Tue, 3 Feb 2004 05:30:02 +0500
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20040203053002.A21975@zzz.ward.six>
References: <20040203023721.A20354@zzz.ward.six> <20040202221723.GD11571@basalt.office.altlinux.org>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040202221723.GD11571@basalt.office.altlinux.org>; from ldv@altlinux.org on Tue, Feb 03, 2004 at 01:17:23AM +0300
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Tue, Feb 03, 2004 at 01:17:23AM +0300, Dmitry V. Levin wrote:
> Hi,
> 
> On Tue, Feb 03, 2004 at 02:37:21AM +0500, Denis Zaitsev wrote:
> > Why such a scheme is used in GLIBC:
> > 
> > declare + define __memrchr, and than
> > 
> > # ifdef __USE_GNU
> > #  define memrchr(s, c, n) __memrchr ((s), (c), (n))
> > # endif
> > 
> > ?  memrchr is not the GNU extension, is it?
> 
> According to memchr(3),
> "The memrchr() function is a GNU extension, available since glibc 2.1.91".

Oh, I'm sorry.  This fact is omited from the texinfo GLIBC
documentation...

Thanks.
