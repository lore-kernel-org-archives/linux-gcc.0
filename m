From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [BUG] GCC 3.4.3/x86: -fomit-frame-pointer cause a lot of test failures for libstdc++
Date: Thu, 23 Dec 2004 01:13:27 +0500
Message-ID: <20041223011327.C14668@natasha.ward.six>
References: <20041222084218.A14668@natasha.ward.six> <D23532B5-53CE-11D9-95A4-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D23532B5-53CE-11D9-95A4-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Tue, Dec 21, 2004 at 11:06:13PM -0500
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Tue, Dec 21, 2004 at 11:06:13PM -0500, Andrew Pinski wrote:
> 
> On Dec 21, 2004, at 10:42 PM, Denis Zaitsev wrote:
> 
> > I've built GCC with -fomit-frame-pointer and -fno-omit-frame-pointer.
> > I mean either of these flags is present in both the exported shell
> > variables CFLAGS and CXXFLAGS and also in the BOOT_CFLAGS variable
> > from gcc/Makefile.  Both the builds was successfull.  And these are
> > some results of 'make check':
> 
> I would not doubt this is the -fomit-frame-pointer exception handling
> bug which was fixed in 3.4.4, 3.3.6, and 4.0.0.
> See PR 17220 and 6764.

I'm trying the patches.  Make check is still going and this should
take the couple more hours.  But it's already obvious that nothing has
changed into the something better...  I've a lot of failures for
libstdc++.  The most of them look like:


FAIL: 22_locale/num_get/get/wchar_t/1.cc execution test
FAIL: 22_locale/num_get/get/wchar_t/2.cc execution test
FAIL: 22_locale/num_get/get/wchar_t/3.cc execution test
FAIL: 22_locale/num_get/get/wchar_t/5.cc execution test
FAIL: 22_locale/num_get/get/wchar_t/6.cc execution test
FAIL: 22_locale/num_get/get/wchar_t/9.cc execution test


BTW, as I can see, the test sources are compiling w/o
-fomit-frame-pointer.  And the only optimization is -O2.  And it's
strange by itself.
