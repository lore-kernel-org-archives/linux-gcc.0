From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Mon, 29 Dec 2003 23:37:08 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031229233708.F6728@zzz.ward.six>
References: <87d6acjlfp.fsf@egil.codesourcery.com> <20031227045815.GA14291@redhat.com> <87fzf6mubo.fsf@egil.codesourcery.com> <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com> <20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com> <3FEFA115.90704@redhat.com> <87k74gjmyh.fsf@codesourcery.com> <20031229053151.GA7231@nevyn.them.org>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14218-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20031229053151.GA7231@nevyn.them.org>; from drow@mvista.com on Mon, Dec 29, 2003 at 12:31:52AM -0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Jacobowitz <drow@mvista.com>
Cc: Zack Weinberg <zack@codesourcery.com>, Ulrich Drepper <drepper@redhat.com>, Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Mon, Dec 29, 2003 at 12:31:52AM -0500, Daniel Jacobowitz wrote:
> Funny, I conducted this experiment last week and found quite the
> opposite.  Compiling the demangler and a smallish yacc parser
> with -D__NO_STRING_INLINES cost about 20% in runtime.

-D__NO_STRING_INLINES just puts the inlining off.  But nobody here
tells about the inline/noinline comparing.  Of course, inlining is
better at speed.  The comparison is doing between some versions of the
inlining.

> I'm not convinced.

If it's possible, please try you experiment with "memory" vs. "m"
versions of inlines.  I will send the patch to you, if it's needed.
