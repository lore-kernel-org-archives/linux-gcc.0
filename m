From: Paul Brook <paul@codesourcery.com>
Subject: Re: [new-ra] GCC-3.3.2/x86: some suspicious behaviour
Date: Thu, 8 Jul 2004 17:52:57 +0100
Sender: gcc-owner@gcc.gnu.org
Message-ID: <200407081752.57212.paul@codesourcery.com>
References: <20040708040643.E17650@natasha.ward.six> <Pine.LNX.4.58.0407081644400.14966@wotan.suse.de> <20040708223119.A7162@natasha.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-99065-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20040708223119.A7162@natasha.ward.six>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gcc@gcc.gnu.org
Cc: Denis Zaitsev <zzz@anda.ru>, Michael Matz <matz@suse.de>, linux-gcc@vger.kernel.org

On Thursday 08 July 2004 17:31, Denis Zaitsev wrote:
> On Thu, Jul 08, 2004 at 04:46:33PM +0200, Michael Matz wrote:
> > Hi,
> >
> > On Thu, 8 Jul 2004, Denis Zaitsev wrote:
> > > So, what does these two commands mean:
> > >
> > >
> > > 	movl	%ecx, 16(%esp)
> > > 	movl	%esi, 20(%esp)
> >
> > It means that the compiler wasn't able to optimize them away.  They do no
> > harm.  FWIW gcc 3.4 or the new-regalloc-branch don't have this problem.
>
> They don't harm.  But to optimize _what_?  So, what is the initial
> meaning of these assignments?  And why they appear only for the double
> asm statement?

They're storing the modified values of s and d back into their stack slots 
after the first asm. The compiler wasn't able to determine that these were 
dead stores.

Remove the "extern inline" and compile with -O0. This will show you 
approximately what the code looks like before optimization.

Paul
