From: Roland McGrath <roland@redhat.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Wed, 24 Dec 2003 16:39:37 -0800
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <200312250039.hBP0dbGe011446@magilla.sf.frob.com>
References: <20031225052045.A18774@zzz.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-14166-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: Denis Zaitsev's message of  Thursday, 25 December 2003 05:20:46 +0500 <20031225052045.A18774@zzz.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Zaitsev <zzz@anda.ru>
Cc: Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

> >From some moment in the past, the next input parameters are used here
> and there in sysdeps/i386/i486/bits/string.h:
> 
>         "m" ( *(struct { char __x[0xfffffff]; } *)__s)
> 
> When I was seeking for the reasons to do so, I've found some
> discussions about this in libc-alpha and gcc mailing lists.  As I
> understand from there, there are an options - to use the "m" arg(s)
> shown above or just to use "memory" in the list of a clobbered
> registers.  So, the question is: why the "m"-way had been choosen?

The reason we use this kind of "m" constraint is that it indicates what we
want to say: memory __s points to might be used.  That means that if the C
aliasing rules allow the compiler to assume that a given other expression
cannot point to the same memory as __s does, it is free to do so and
optimize out stores through unrelated pointers that cannot affect __s.
Conversely, a "memory" clobber tells the compiler that it must assume that
all memory any pointer points to might be read by this asm.

> I'm asking, because I've found that this "m"-way leads GCC to produce
> an unoptimal enough assembler, while "memory" code is ok.

That is an issue for GCC.  It is correct for glibc (and other code) to use
the asm constraints that express the true precise set of constraints and
tell the compiler it is free to do us much as is in fact safe.  As to
whether your "+&r" constraints on the pointer values are correct, I don't know.
