From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [BUG] GCC 3.4.3/x86: -fomit-frame-pointer cause a lot of test failures for libstdc++
Date: Tue, 21 Dec 2004 23:06:13 -0500
Message-ID: <D23532B5-53CE-11D9-95A4-000A95D692F4@physics.uc.edu>
References: <20041222084218.A14668@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <20041222084218.A14668@natasha.ward.six>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org


On Dec 21, 2004, at 10:42 PM, Denis Zaitsev wrote:

> I've built GCC with -fomit-frame-pointer and -fno-omit-frame-pointer.
> I mean either of these flags is present in both the exported shell
> variables CFLAGS and CXXFLAGS and also in the BOOT_CFLAGS variable
> from gcc/Makefile.  Both the builds was successfull.  And these are
> some results of 'make check':

I would not doubt this is the -fomit-frame-pointer exception handling
bug which was fixed in 3.4.4, 3.3.6, and 4.0.0.
See PR 17220 and 6764.

-- Pinski

