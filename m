From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 06:45:18 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031225064518.F7419@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14171-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <87isk5lmk3.fsf@codesourcery.com>; from zack@codesourcery.com on Wed, Dec 24, 2003 at 05:21:16PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Wed, Dec 24, 2003 at 05:21:16PM -0800, Zack Weinberg wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> >> You could use the "X" constraint, which is supposed to mean "anything"
> >> and by implication "unused", but it's normally only with scratch
> >> registers, not memories, and the address reloads don't get deleted.
> >  
> > Yes, I've tried the "X" - there is no difference from the "m" - all
> > the same unneded extra code (exactly).
> 
> I think the most constructive thing for you to do is find out _why_
> all this unneeded extra code is being generated for "m" constraints
> and then submit a patch to fix it.

So, does it mean that we are indeed speaking about the problem in GCC?
And I agree, probably it's the best way...  So, whould you please to
show me any points to speed up my start?  For now, the only one part
of GCC is not really new for me :)
