From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [BUG] GCC 3.4.3/x86: -fomit-frame-pointer cause a lot of test failures for libstdc++
Date: Wed, 22 Dec 2004 09:34:23 +0500
Message-ID: <20041222093422.B14668@natasha.ward.six>
References: <20041222084218.A14668@natasha.ward.six> <D23532B5-53CE-11D9-95A4-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <gcc-return-107002-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <D23532B5-53CE-11D9-95A4-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Tue, Dec 21, 2004 at 11:06:13PM -0500
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

Ok, I'll try.  Am I understand right, that the versions you've listed
are still unreleased?
