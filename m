From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sun, 28 Dec 2003 22:54:19 -0500
Sender: gcc-owner@gcc.gnu.org
Message-ID: <ADD79872-39B2-11D8-A0F4-000393A6D2F2@physics.uc.edu>
References: <20031225052045.A18774@zzz.ward.six>	<20031225003819.GC13447@redhat.com>	<20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>	<20031225064518.F7419@zzz.ward.six>	<87d6acjlfp.fsf@egil.codesourcery.com>	<20031227045815.GA14291@redhat.com>	<87fzf6mubo.fsf@egil.codesourcery.com>	<20031227163540.B6728@zzz.ward.six>	<87brpum7gm.fsf@egil.codesourcery.com>	<20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com> <3FEFA115.90704@redhat.com>
Mime-Version: 1.0 (Apple Message framework v609)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-87962-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <3FEFA115.90704@redhat.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ulrich Drepper <drepper@redhat.com>
Cc: linux-gcc@vger.kernel.org, Andreas Jaeger <aj@suse.de>, gcc@gcc.gnu.org, Richard Henderson <rth@redhat.com>, Zack Weinberg <zack@codesourcery.com>, Andrew Pinski <pinskia@physics.uc.edu>, libc-alpha@sources.redhat.com


On Dec 28, 2003, at 22:35, Ulrich Drepper wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Zack Weinberg wrote:
>> I once tried to get Uli to take them out again, with
>> hard numbers to back me up, but he ignored me.
>
> I have absolutely no problem taking out the inlines once gcc is able to
> perform the same optimizations.  Problem is that nobody spent the time
> so far to complete the task in gcc.  As far as I know each function we
> still have has an advantage over the gcc code.
>
> Just look at the inlines to determine what is optimized, do it in gcc,
> and let me know.  Then I'll remove the inline.

We already do more when it comes to removing sqrt and other math 
functions and also
some string functions we optimize without the need for the string 
instructions.
In fact GCC does more optimizations on string functions than glibc does 
already.

The functions that GCC does not optimize that glibc does are the 
following:
memrchr
strncat (we do sometimes)
strncmp
strchr (with a FIXME in GCC)
strchrnul
strcspn
strspn
strpbrk
strstr (we do a better job for "a", but we do not do it for the general 
case)


The common cases of strcpy, memcpy, etc. we do optimize greatly and as 
the math
library we do too.

Thanks,
Andrew Pinski

