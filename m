From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Tue, 30 Dec 2003 00:37:20 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031230003720.I6728@zzz.ward.six>
References: <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com> <20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com> <3FEFA115.90704@redhat.com> <87k74gjmyh.fsf@codesourcery.com> <20031229053151.GA7231@nevyn.them.org> <20031229233708.F6728@zzz.ward.six> <8765fzjvad.fsf@egil.codesourcery.com> <20031230003147.H6728@zzz.ward.six>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14223-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20031230003147.H6728@zzz.ward.six>; from zzz@anda.ru on Tue, Dec 30, 2003 at 12:31:47AM +0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>, Daniel Jacobowitz <drow@mvista.com>, Ulrich Drepper <drepper@redhat.com>, Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Tue, Dec 30, 2003 at 12:31:47AM +0500, Denis Zaitsev wrote:

> On Mon, Dec 29, 2003 at 11:09:14AM -0800, Zack Weinberg wrote:

> > Same if the out-of-line memcpy takes several more instructions to
> > set up but makes damn sure to do aligned memory accesses
> > (full-bus-width loads, nontemporal store, prefetches, etc etc etc),
> > whereas the inline one doesn't.

Sorry, I mean the inline functions below!  Of course!

> First, they are trying to do so here and there (but ok, not fine).
> 
> Second, I have experimented with this nonaligned access some time
> ago.  I don't remember exactly, but it seems that the modern x86
> processors do the job as fine as when the memory access is aligned.
> But as it was too far ago, I can't recollect the details and so I
> won't insist.  Better I will repeat the measurements...
