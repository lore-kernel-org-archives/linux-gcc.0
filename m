From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 06:13:38 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031225061338.D7419@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <200312250039.hBP0dbGe011446@magilla.sf.frob.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14167-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <200312250039.hBP0dbGe011446@magilla.sf.frob.com>; from roland@redhat.com on Wed, Dec 24, 2003 at 04:39:37PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Wed, Dec 24, 2003 at 04:39:37PM -0800, Roland McGrath wrote:
> > >From some moment in the past, the next input parameters are used here
> > and there in sysdeps/i386/i486/bits/string.h:
> >
> >         "m" ( *(struct { char __x[0xfffffff]; } *)__s)
> >
> > When I was seeking for the reasons to do so, I've found some
> > discussions about this in libc-alpha and gcc mailing lists.  As I
> > understand from there, there are an options - to use the "m" arg(s)
> > shown above or just to use "memory" in the list of a clobbered
> > registers.  So, the question is: why the "m"-way had been choosen?
>
> The reason we use this kind of "m" constraint is that it indicates what we
> want to say: memory __s points to might be used.  That means that if the C
> aliasing rules allow the compiler to assume that a given other expression
> cannot point to the same memory as __s does, it is free to do so and
> optimize out stores through unrelated pointers that cannot affect __s.
> Conversely, a "memory" clobber tells the compiler that it must assume that
> all memory any pointer points to might be read by this asm.

Yes, I understand all this.  But in that discussion in past the
similar question was already touched - the "precise" "m"-way doesn't
get any real-life benefit.

> > I'm asking, because I've found that this "m"-way leads GCC to produce
> > an unoptimal enough assembler, while "memory" code is ok.
>
> That is an issue for GCC.

Yes, I have no way other than just to agree...

> It is correct for glibc (and other code) to use the asm constraints
> that express the true precise set of constraints and tell the
> compiler it is free to do us much as is in fact safe.  As to whether
> your "+&r" constraints on the pointer values are correct, I don't
> know.

"+&r" is just a shortcut for :"=&r":"0":.  It's correct and doesn't
touch the "m" issue.
