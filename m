From: Daniel Jacobowitz <drow@mvista.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Mon, 29 Dec 2003 00:31:52 -0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031229053151.GA7231@nevyn.them.org>
References: <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com> <20031227045815.GA14291@redhat.com> <87fzf6mubo.fsf@egil.codesourcery.com> <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com> <20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com> <3FEFA115.90704@redhat.com> <87k74gjmyh.fsf@codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14213-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <87k74gjmyh.fsf@codesourcery.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Ulrich Drepper <drepper@redhat.com>, Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Sun, Dec 28, 2003 at 07:56:54PM -0800, Zack Weinberg wrote:
> Ulrich Drepper <drepper@redhat.com> writes:
> 
> > Zack Weinberg wrote:
> >> I once tried to get Uli to take them out again, with
> >> hard numbers to back me up, but he ignored me.
> >
> > I have absolutely no problem taking out the inlines once gcc is able to
> > perform the same optimizations.  Problem is that nobody spent the time
> > so far to complete the task in gcc.
> 
> This is true - I believe Joseph Myers put a list of yet-to-be-done
> optimizations on the GCC projects page ...
> 
> > As far as I know each function we still have has an advantage over
> > the gcc code.
> 
> ... however, that advantage is only theoretical.  Experiments such as
> Peter Zaitsev's just now, and mine several years ago, demonstrate that
> the bits/string.h and bits/string2.h inlines make code worse, not better.
> Therefore they should be removed.

Funny, I conducted this experiment last week and found quite the
opposite.  Compiling the demangler and a smallish yacc parser
with -D__NO_STRING_INLINES cost about 20% in runtime.

I'm not convinced.

-- 
Daniel Jacobowitz
MontaVista Software                         Debian GNU/Linux Developer
