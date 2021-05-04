From: Willy Tarreau <w@1wt.eu>
Subject: Re: GCC, unaligned access and UB in the Linux kernel
Date: Tue, 4 May 2021 22:51:09 +0200
Message-ID: <20210504205109.GA19716@1wt.eu>
References: <c8fa8ea79ffaa5c87dac9ea16e12088c94a35faf.camel@gmail.com>
 <877dkekzj8.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <877dkekzj8.fsf@mid.deneb.enyo.de>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Weimer <fw@deneb.enyo.de>
Cc: "Vladislav K. Valtchev" <vladislav.valtchev@gmail.com>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-toolchains@vger.kernel.org

Hi Florian,

On Tue, May 04, 2021 at 10:35:39PM +0200, Florian Weimer wrote:
> > [1] If aliasing is involved, even with -fno-strict-aliasing, unaligned access
> > WILL break some code, today. Check the following example:
> >
> >    int h(int *p, int *q){
> >      *p = 1;
> >      *q = 1;
> >      return *p;
> >    }
> >
> >    typedef __attribute__((__may_alias__)) int I;
> >
> >    I k(I *p, I *q){
> >      *p = 1;
> >      *q = 1;
> >      return *p;
> >    }
> >
> > Starting from GCC 8.1, both h() and k() will always return 1, when compiled with
> > -O2, even with -fno-strict-aliasing.
> >
> > [2] Some SIMD instructions have alignment requirements that recent compilers
> > might just start to assume to be true, in my current understanding. In general,
> > SIMD instructions can be emitted automatically by the compiler because of auto-
> > vectorization. But, fortunately, that *cannot* happen in the kernel because we
> > build with -fno-mmx, -fno-sse, -fno-avx etc.
> 
> Cc:ing linux-toolchains.
> 
> __attribute__ ((aligned (1))) can be used to reduce alignment, similar
> to attribute packed on structs.  If that doesn't work for partially
> overlapping accesses, that's probably a compiler bug.

Indeed, for me it fixes the example above with gcc-8.4:

Before:
0000000000000020 <k>:
  20:   c7 07 01 00 00 00       movl   $0x1,(%rdi)
  26:   b8 01 00 00 00          mov    $0x1,%eax
  2b:   c7 06 01 00 00 00       movl   $0x1,(%rsi)
  31:   c3                      retq   

After:
0000000000000020 <k>:
  20:   c7 07 01 00 00 00       movl   $0x1,(%rdi)
  26:   c7 06 01 00 00 00       movl   $0x1,(%rsi)
  2c:   8b 07                   mov    (%rdi),%eax
  2e:   c3                      retq   

That's good to know :-)

Willy
