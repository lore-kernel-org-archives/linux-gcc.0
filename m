From: Jakub Jelinek <jakub@redhat.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Mon, 29 Dec 2003 07:57:41 +0100
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20031229065741.GM12344@sunsite.ms.mff.cuni.cz>
References: <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com> <20031227045815.GA14291@redhat.com> <87fzf6mubo.fsf@egil.codesourcery.com> <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com> <20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com> <3FEFA115.90704@redhat.com> <ADD79872-39B2-11D8-A0F4-000393A6D2F2@physics.uc.edu>
Reply-To: Jakub Jelinek <jakub@redhat.com>
Mime-Version: 1.0
Return-path: <gcc-return-87968-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <ADD79872-39B2-11D8-A0F4-000393A6D2F2@physics.uc.edu>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: Ulrich Drepper <drepper@redhat.com>, linux-gcc@vger.kernel.org, Andreas Jaeger <aj@suse.de>, gcc@gcc.gnu.org, Richard Henderson <rth@redhat.com>, Zack Weinberg <zack@codesourcery.com>, libc-alpha@sources.redhat.com

On Sun, Dec 28, 2003 at 10:54:19PM -0500, Andrew Pinski wrote:
> >Zack Weinberg wrote:
> >>I once tried to get Uli to take them out again, with
> >>hard numbers to back me up, but he ignored me.
> >
> >I have absolutely no problem taking out the inlines once gcc is able to
> >perform the same optimizations.  Problem is that nobody spent the time
> >so far to complete the task in gcc.  As far as I know each function we
> >still have has an advantage over the gcc code.
> >
> >Just look at the inlines to determine what is optimized, do it in gcc,
> >and let me know.  Then I'll remove the inline.
> 
> We already do more when it comes to removing sqrt and other math 
> functions and also
> some string functions we optimize without the need for the string 
> instructions.
> In fact GCC does more optimizations on string functions than glibc does 
> already.

I think all inlines/macros which are to be removed from bits/string{,2}.h
should be benchmarked first with various constant and variable arguments on
various architectures.
I did it for some routines 2 years ago:
http://sources.redhat.com/ml/libc-hacker/2001-11/msg00035.html
http://sources.redhat.com/ml/libc-hacker/2002-01/msg00091.html

> The functions that GCC does not optimize that glibc does are the 
> following:
> memrchr
> strncat (we do sometimes)
> strncmp
> strchr (with a FIXME in GCC)
> strchrnul
> strcspn
> strspn
> strpbrk
> strstr (we do a better job for "a", but we do not do it for the general 
> case)
> 
> 
> The common cases of strcpy, memcpy, etc. we do optimize greatly and as 
> the math
> library we do too.

	Jakub
