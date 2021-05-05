From: "Vladislav K. Valtchev" <vladislav.valtchev@gmail.com>
Subject: Re: GCC, unaligned access and UB in the Linux kernel
Date: Wed, 05 May 2021 14:23:04 +0300
Message-ID: <c7bc234b3db34e360851fc1bf75c20c51ecd7a7b.camel@gmail.com>
References: <c8fa8ea79ffaa5c87dac9ea16e12088c94a35faf.camel@gmail.com>
         <fbe611b513f140b5be570e9d3d94e84d@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ho2fgPHfPVggnjV1Isj1BcjL00TVG3osLwJZswUZewU=;
        b=OPoAOnf8pM8uEy9Qc2gqKvI6zpM6e1WToi+2KtqLY9F5gqnPR2QXlm32ijQZtA24OY
         5R99SWufycC90BEBpZjlprnNdsexpIG1u5KLZrV9pi/dbUH+g5Vdpdph9i16gsq8bmKH
         oldxBMM6gzTDfjFp5/4GFY2kk6Sync4IA/DAa/e9NLuUU3Y38nsZG9P/Tw6hDjWijCJK
         0osQa0xPHNRQVKUU4+4K/BiaQTUXMAFJzABT+2BTTmDIo7+lgfQR+OQKTWpd9+LzYC5v
         ZIl3SlxE8cAhvTZk6m3s9SFnteGxEK9BpXL5TxiQPO2YF/B44xBknp6rRAc+bTVZyoPO
         OHvw==
In-Reply-To: <fbe611b513f140b5be570e9d3d94e84d@AcuMS.aculab.com>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Laight <David.Laight@ACULAB.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gcc@vger.kernel.org" <linux-gcc@vger.kernel.org>, linux-toolchains@vger.kernel.org

On Wed, 2021-05-05 at 10:41 +0000, David Laight wrote:
> > That's nice and seems to work today as expected, but there's one problem:
> > unaligned access is UB according to the ISO C standard, ...
> 
> The C standard isn't relevant.

Forget that I mentioned it. Unaligned access is UB for GCC, no matter the
architecture. Please check all the comments in this WONTFIX bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93031

> That doesn't help you at all.

As I mentioned, TODAY that is not a problem. But as the GCC guys insist that
they consider it UB, one morning we might wake up and discover that with the
latest version of GCC, the kernel is misbehaving.

> If the compiler is given any hint that the address is aligned
> it will use potentially misaligned memory accesses.
> So if the above was:
> 	*(int __attribute__((packed)) *)p = val;
> and the caller had:
> 	int *p = maybe_unaligned();
> 	put_unaligned_le32(0, p);
> 

Yeah, but you changed the code. That's what I'm talking about.
The code that I quoted is *current* code existing in the kernel that still works
because GCC doesn't have *yet* an optimization that breaks it. The GCC guys
explicitly claim we should NOT write code like that, not even on architectures
that support unaligned access natively, because it's UB and they might break it
any moment. 

> Then gcc will generate a 32bit write even on sparc.
> __builtin_memcpy() will expand to exactly the same 32bit write.

I don't understand what you want mean with that comparison other than it's
possible to achieve the same result in another way.

__builtin_memcpy() does what we want it to do, and doesn't require
maybe_unaligned() nor __attribute__((packed)), nor it emits more instructions.
Therefore, it looks to me that put_unaligned_le32() could be re-implemented with
__builtin_memcpy() without any drawbacks.

> This is nothing new - at least 20 years.
> 
> Basically, the C standard only allows you to cast a pointer
> to 'void *' and then back to its original type.
> GCC makes use of this for various optimisations and will
> track the alignment through (void *) casts.

The compiler cannot track the alignment across function calls in different
translation units. It can only assume that the alignment is already correct
(ehm, runtime checking is out of the table of course, except for UBSAN).

Today, when we read/write an integer, GCC emits a MOV instruction (on x86) and
it doesn't care about the alignment. That's why it works and, honestly, I wish
it to continue to work like that. But, that's not necessarily what will happen.


> I believe that, even for the simd instructions, gcc will pick
> the 'misalign supporting' version if the data is marked
> with the relevant alignment.
> 
> Oh - and the loop vectorisation code is a pile of crap.
> You almost never want it - look at the code it generates
> for a loop you go round a few times.
> It you are doing 10000 iteractions you'll need to unroll
> it yourself to get decent performance.


In kernel we don't care about the SIMD case, because such instructions are
disabled. I just mentioned it, for the sake of completeness. When compiling user
applications, SIMD instruction are normally allowed and some of them have
alignment requirements that the compiler might assume as given instead of
checking, because dereferencing unaligned pointers is UB.


-- 
Vladislav Valtchev (vvaltchev)

