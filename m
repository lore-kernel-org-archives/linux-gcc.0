From: Michael Matz <matz@suse.de>
Subject: Re: [new-ra] GCC-3.3.2/x86: some suspicious behaviour
Date: Thu, 8 Jul 2004 16:46:33 +0200 (CEST)
Sender: gcc-owner@gcc.gnu.org
Message-ID: <Pine.LNX.4.58.0407081644400.14966@wotan.suse.de>
References: <20040708040643.E17650@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-99058-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20040708040643.E17650@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Hi,

On Thu, 8 Jul 2004, Denis Zaitsev wrote:

> So, what does these two commands mean:
> 
> 
> 	movl	%ecx, 16(%esp)
> 	movl	%esi, 20(%esp)

It means that the compiler wasn't able to optimize them away.  They do no 
harm.  FWIW gcc 3.4 or the new-regalloc-branch don't have this problem.

> The result is the same for any -O >0 and for -Os.  And the presence of
> these suspicious commands are not affected by the frame-pointer option.


Ciao,
Michael.
