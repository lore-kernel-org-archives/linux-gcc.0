From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Tue, 30 Dec 2003 00:31:47 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031230003147.H6728@zzz.ward.six>
References: <87fzf6mubo.fsf@egil.codesourcery.com> <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com> <20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com> <3FEFA115.90704@redhat.com> <87k74gjmyh.fsf@codesourcery.com> <20031229053151.GA7231@nevyn.them.org> <20031229233708.F6728@zzz.ward.six> <8765fzjvad.fsf@egil.codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14222-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <8765fzjvad.fsf@egil.codesourcery.com>; from zack@codesourcery.com on Mon, Dec 29, 2003 at 11:09:14AM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Daniel Jacobowitz <drow@mvista.com>, Ulrich Drepper <drepper@redhat.com>, Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Mon, Dec 29, 2003 at 11:09:14AM -0800, Zack Weinberg wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> > On Mon, Dec 29, 2003 at 12:31:52AM -0500, Daniel Jacobowitz wrote:
> >> Funny, I conducted this experiment last week and found quite the
> >> opposite.  Compiling the demangler and a smallish yacc parser
> >> with -D__NO_STRING_INLINES cost about 20% in runtime.
> >
> > -D__NO_STRING_INLINES just puts the inlining off.  But nobody here
> > tells about the inline/noinline comparing.  Of course, inlining is
> > better at speed.  The comparison is doing between some versions of the
> > inlining.
> 
> No.  There is no "of course" here.

Strictly speaking, you are right.  But in general, in the real life in
average etc., when strings are too short the effects you are
describing below to appear etc. etc., my "of course" is near enough to
the truth.

> If your inlined functions blow out the instruction cache, it may
> wind up being a net lose.

Definitely.  This is why I don't like when the inline functions are
growing, putting the effects of "m" down...

> Same if the out-of-line memcpy takes several more instructions to
> set up but makes damn sure to do aligned memory accesses
> (full-bus-width loads, nontemporal store, prefetches, etc etc etc),
> whereas the inline one doesn't.

First, they are trying to do so here and there (but ok, not fine).

Second, I have experimented with this nonaligned access some time
ago.  I don't remember exactly, but it seems that the modern x86
processors do the job as fine as when the memory access is aligned.
But as it was too far ago, I can't recollect the details and so I
won't insist.  Better I will repeat the measurements...
