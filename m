From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: strcmp is too heavy for its everyday usage...
Date: Fri, 9 Jan 2004 13:49:28 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040109134928.B8801@zzz.ward.six>
References: <20040108060924.A4431@zzz.ward.six> <200401080113.i081DB1c000920@magilla.sf.frob.com> <20040108063636.C11508@zzz.ward.six> <jeoetehjoj.fsf@sykes.suse.de> <20040109101145.A8801@zzz.ward.six> <20040109081231.GA4218@twiddle.net>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14368-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20040109081231.GA4218@twiddle.net>; from rth@twiddle.net on Fri, Jan 09, 2004 at 12:12:31AM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Andreas Schwab <schwab@suse.de>, Roland McGrath <roland@redhat.com>, Zack Weinberg <zack@codesourcery.com>, Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Fri, Jan 09, 2004 at 12:12:31AM -0800, Richard Henderson wrote:
> On Fri, Jan 09, 2004 at 10:11:45AM +0500, Denis Zaitsev wrote:
> >     (r= a[0] - b[0]) &&
> >     (r= a[1] - b[1]) &&
> >     (r= a[2] - b[2]) &&
> >     (r= a[3] - b[3]);
> >     return r;
> > }
> > 
> > It's a typical inline code for compare 4-byte of mem.  When it is
> > used, say, in such a context
> > 
> >         s(a,b) ? A() : B();
> > 
> > GCC discards the value of r perfectly, leaving the only code needed
> > for compare bytes for eq/neq.  But GCC doesn't merge the 4 byte
> > comparing into single word comparing.  And, as I understand, it will
> > never do that, as it's not asked to.  Or this kind of optimization is
> > assumed ok for compiler, but just still unimplemented?
> 
> Certainly it's ok if it converts.
> 
> However, on most targets you'd have to know that a and b are aligned.
> Worse, even for targets like x86 that support unaligned loads you have
> to know for certain that neither a[3] nor b[3] could possibly segv
> when a[0] and b[0] won't.

Yes, and therefore this code is for memcmp, not for strcmp.  BTW, do I
understand right, that memcmp is free of that problem, as it has the
explicit length argument?  And this arg says implicitly, that the
access for the mem thru all this length is ok?
