From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sun, 28 Dec 2003 21:55:33 -0800
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <87fzf4jhgq.fsf@codesourcery.com>
References: <20031225064518.F7419@zzz.ward.six>
	<87d6acjlfp.fsf@egil.codesourcery.com>
	<20031227045815.GA14291@redhat.com>
	<87fzf6mubo.fsf@egil.codesourcery.com>
	<20031227163540.B6728@zzz.ward.six>
	<87brpum7gm.fsf@egil.codesourcery.com>
	<20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com>
	<3FEFA115.90704@redhat.com> <87k74gjmyh.fsf@codesourcery.com>
	<20031229053151.GA7231@nevyn.them.org>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <20031229053151.GA7231@nevyn.them.org> (Daniel Jacobowitz's
 message of "Mon, 29 Dec 2003 00:31:52 -0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Drepper <drepper@redhat.com>
Cc: Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org


> > ... however, that advantage is only theoretical.  Experiments such as
> > Peter Zaitsev's just now, and mine several years ago, demonstrate that
> > the bits/string.h and bits/string2.h inlines make code worse, not better.
> > Therefore they should be removed.
>
> Funny, I conducted this experiment last week and found quite the
> opposite.  Compiling the demangler and a smallish yacc parser
> with -D__NO_STRING_INLINES cost about 20% in runtime.

That's interesting.  My testing was with much larger programs where
str* / mem* aren't the bottleneck anyway.  I wonder if you would be
willing to take a look at the differences in the assembly language
and see where that 20% is coming from.

zw
