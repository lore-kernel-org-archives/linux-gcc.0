From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sat, 27 Dec 2003 15:52:52 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031227155251.A6728@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com> <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14181-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <87d6acjlfp.fsf@egil.codesourcery.com>; from zack@codesourcery.com on Thu, Dec 25, 2003 at 07:40:42PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Thu, Dec 25, 2003 at 07:40:42PM -0800, Zack Weinberg wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> > So, does it mean that we are indeed speaking about the problem in
> > GCC?
> 
> I think you've demonstrated that there isn't an ideal way to write
> this construct right now.  ("memory" clobbers having their own
> problems).

Really, I did mean that "m" is worse than "memory" (say, "in
general"), but it was choosen to use and it is enigmatic for me.
There was a discussion in the past about the advantages given by "m"
over just "memory".  And as I understand, these advantages are really
nothing.  But the dummy code size they added to, say, glibc-2.3.2 is
6Kb.

> The next stage is to figure out (a) what the right notation is, and
> (b) what needs to be done in GCC to make it work.  I cannot tell
> whether the semantics of "m" should change, or whether new notation

Semantics?  Or may be implementation?  It seems that all ok with the
semantics...
