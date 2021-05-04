From: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: GCC, unaligned access and UB in the Linux kernel
Date: Tue, 04 May 2021 22:35:39 +0200
Message-ID: <877dkekzj8.fsf@mid.deneb.enyo.de>
References: <c8fa8ea79ffaa5c87dac9ea16e12088c94a35faf.camel@gmail.com>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <c8fa8ea79ffaa5c87dac9ea16e12088c94a35faf.camel@gmail.com>
        (Vladislav K. Valtchev's message of "Tue, 04 May 2021 21:07:46 +0300")
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladislav K. Valtchev" <vladislav.valtchev@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-toolchains@vger.kernel.org

* Vladislav K. Valtchev:

> Hi everyone,
>
> I noticed that in the Linux kernel we have a define called
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS that's used in a fair amount of places
> with the following purpose: when it's set, unaligned access is supported by the
> CPU so we can do it directly, otherwise fall-back to some logic where a byte at
> the time is read/written. For example, check the implementation of
> do_strncpy_from_user():
> https://elixir.bootlin.com/linux/latest/source/lib/strncpy_from_user.c#L15
>
>
> That's nice and seems to work today as expected, but there's one problem:
> unaligned access is UB according to the ISO C standard, no matter if the
> architecture supports it or not. Also, GCC doesn't have any option similar to "-
> fno-strict-aliasing" to make unaligned access non-UB. At the moment, they won't
> consider introducing such an option either. Check this bug:
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93031
>
> Starting from GCC 8.x, the compiler introduced some new optimizations that
> assume correct alignment which can break some code[1]. However, unaligned access
> like the following [from do_strncpy_from_user()]:
>
>     *(unsigned long *)(dst+res) = c;
>
> Still generate correct instructions because:
>
>   1. There's no aliasing involved [1]
>   2. SIMD instructions are not allowed in the kernel [2]
>
> But that doesn't mean at all that things won't change in the future. At any
> point, some optimization in a newer compiler might generate incorrect code even
> for the above-mentioned example. Therefore, while I understand compiler
> engineers' point of view (they provide a compiler with an ISO-compliant
> behaviour), I'm concerned about the correctness of all the code that assumes
> unaligned access (on some architectures) in C is just fine. 
>
> Mitigations
> ------------
> In my understanding, the simplest way to force GCC to emit a single MOV
> instruction with unaligned access, without risking any kind of UB, is to use
> __builtin_memcpy(). It works great, but it requires fixing the code in many
> places. Also, maybe using get_unaligned()/put_unaligned() is the right thing to
> do? The problem is that the put_unaligned_* inline functions don't use
> __builtin_memcpy() and are defined like:
>
>    static __always_inline void put_unaligned_le32(u32 val, void *p)
>    {
>    	*((__le32 *)p) = cpu_to_le32(val);
>    }
>
> So, still UB. To make the compiler happy, maybe we should make them use
> __builtin_memcpy()?
>
>
> Conclusion
> -------------
> What do you think about all of this? I realize that this is not a big urgent
> problem *right now*, but at some point it might become one. How do you believe
> this problem should be addressed in Linux? 
>
>
> Thanks,
> Vlad
>
>
>
> Footnotes
> ---------------------------------------------------
> [1] If aliasing is involved, even with -fno-strict-aliasing, unaligned access
> WILL break some code, today. Check the following example:
>
>    int h(int *p, int *q){
>      *p = 1;
>      *q = 1;
>      return *p;
>    }
>
>    typedef __attribute__((__may_alias__)) int I;
>
>    I k(I *p, I *q){
>      *p = 1;
>      *q = 1;
>      return *p;
>    }
>
> Starting from GCC 8.1, both h() and k() will always return 1, when compiled with
> -O2, even with -fno-strict-aliasing.
>
> [2] Some SIMD instructions have alignment requirements that recent compilers
> might just start to assume to be true, in my current understanding. In general,
> SIMD instructions can be emitted automatically by the compiler because of auto-
> vectorization. But, fortunately, that *cannot* happen in the kernel because we
> build with -fno-mmx, -fno-sse, -fno-avx etc.

Cc:ing linux-toolchains.

__attribute__ ((aligned (1))) can be used to reduce alignment, similar
to attribute packed on structs.  If that doesn't work for partially
overlapping accesses, that's probably a compiler bug.
