From: Jim Wilson <wilson@specifixinc.com>
Subject: Re: Kernel Cross Compiling
Date: 16 Feb 2004 14:50:41 -0800
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <1076971842.1055.102.camel@leaf.tuliptree.org>
References: <20040213205743.GA30245@MAIL.13thfloor.at>
	<16429.16944.521739.223708@napali.hpl.hp.com>
	<20040213214420.GA32006@MAIL.13thfloor.at> 
	<16429.29392.529575.21798@napali.hpl.hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <16429.29392.529575.21798@napali.hpl.hp.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Mosberger <davidm@hpl.hp.com>
Cc: Herbert Poetzl <herbert@13thfloor.at>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org

On Fri, 2004-02-13 at 16:58, David Mosberger wrote:
>   >> A recipe for building ia32->ia64 cross-toolchain on Debian can be
>   >> found here:
>   >> http://www.gelato.unsw.edu.au/IA64wiki/CrossCompilation

I recommend Dan Kegel's page for anyone trying to build a cross compiler
to linux.  See
	http://kegel.com/crosstool
This isn't very hard to follow, and it gives you a properly configured
and built gcc/glibc for the target.

I don't recommend the inhibit_libc trick for building linux crosses.  It
may work well enough for kernel builds, but it will give you a subtly
broken gcc, and that may lead to confusion later.
-- 
Jim Wilson, GNU Tools Support, http://www.SpecifixInc.com

