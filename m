From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 06:15:24 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031225061524.E7419@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14168-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20031225003819.GC13447@redhat.com>; from rth@redhat.com on Wed, Dec 24, 2003 at 04:38:19PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Wed, Dec 24, 2003 at 04:38:19PM -0800, Richard Henderson wrote:
> On Thu, Dec 25, 2003 at 05:20:46AM +0500, Denis Zaitsev wrote:
> > >From some moment in the past, the next input parameters are used here
> > and there in sysdeps/i386/i486/bits/string.h:
> >
> >         "m" ( *(struct { char __x[0xfffffff]; } *)__s)
> >
> > When I was seeking for the reasons to do so, I've found some
> > discussions about this in libc-alpha and gcc mailing lists.  As I
> > understand from there, there are an options - to use the "m" arg(s)
> > shown above or just to use "memory" in the list of a clobbered
> > registers.  So, the question is: why the "m"-way had been choosen?
>
> Someone wanted to describe that memory is read, but not written.
> There's no real good way to do that.
>
> You could use the "X" constraint, which is supposed to mean "anything"
> and by implication "unused", but it's normally only with scratch
> registers, not memories, and the address reloads don't get deleted.
 
Yes, I've tried the "X" - there is no difference from the "m" - all
the same unneded extra code (exactly).
 
> You could file an enhancement pr against "X" if you want.

Do you mean a kind of a complain that "X" does't work as it should?
