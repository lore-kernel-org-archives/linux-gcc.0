From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: Kernel Cross Compiling
Date: Fri, 13 Feb 2004 22:44:20 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040213214420.GA32006@MAIL.13thfloor.at>
References: <20040213205743.GA30245@MAIL.13thfloor.at> <16429.16944.521739.223708@napali.hpl.hp.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16429.16944.521739.223708@napali.hpl.hp.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davidm@hpl.hp.com
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org

On Fri, Feb 13, 2004 at 01:31:28PM -0800, David Mosberger wrote:
> >>>>> On Fri, 13 Feb 2004 21:57:43 +0100, Herbert Poetzl <herbert@13thfloor.at> said:
> 
>   Herbert> I got all headers fixed, except for the ia64, which still
>   Herbert> doesn't work
> 
> Something sounds wrong here. You shouldn't have to patch headers.
> 
> A recipe for building ia32->ia64 cross-toolchain on Debian can be
> found here:
> 
>  http://www.gelato.unsw.edu.au/IA64wiki/CrossCompilation

that might work with the ia64 libraries and headers,
but it seems to fail, with the headers included in
the gcc tarball, for cross compiling, if you get it
to compile without (g)libc which should not be required
to build the crossgcc and the kernel, I would be very
interested ...

anyway, thanks for the url,
Herbert

> 	--david
> -
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
