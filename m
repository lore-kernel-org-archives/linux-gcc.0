From: Richard Henderson <rth@redhat.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Wed, 24 Dec 2003 16:38:19 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20031225003819.GC13447@redhat.com>
References: <20031225052045.A18774@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-87916-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <20031225052045.A18774@zzz.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Thu, Dec 25, 2003 at 05:20:46AM +0500, Denis Zaitsev wrote:
> >From some moment in the past, the next input parameters are used here
> and there in sysdeps/i386/i486/bits/string.h:
> 
>         "m" ( *(struct { char __x[0xfffffff]; } *)__s)
> 
> When I was seeking for the reasons to do so, I've found some
> discussions about this in libc-alpha and gcc mailing lists.  As I
> understand from there, there are an options - to use the "m" arg(s)
> shown above or just to use "memory" in the list of a clobbered
> registers.  So, the question is: why the "m"-way had been choosen?

Someone wanted to describe that memory is read, but not written.
There's no real good way to do that.

You could use the "X" constraint, which is supposed to mean "anything"
and by implication "unused", but it's normally only with scratch
registers, not memories, and the address reloads don't get deleted.

You could file an enhancement pr against "X" if you want.



r~
