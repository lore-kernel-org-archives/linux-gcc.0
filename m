From: Der Herr Hofrat <der.herr@mail.hofr.at>
Subject: Re: Measure time
Date: Wed, 8 May 2002 18:58:47 +0200 (CEST)
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <200205081658.g48GwmV06862@hofr.at>
References: <NCBBLGAKEDCMNBGMONMPMEEHCKAA.pickle@alien.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <NCBBLGAKEDCMNBGMONMPMEEHCKAA.pickle@alien.net.au> from Simon Butcher
 at "May 9, 2002 02:51:42 am"
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Butcher <pickle@alien.net.au>
Cc: "Serguei I. Ivantsov" <admin@gsc-game.kiev.ua>, Der Herr Hofrat <der.herr@mail.hofr.at>, linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

> 
> Hi,
> 
> ftime() will return milliseconds, but it's considered an obsolete function.
> You could use gettimeofday() (as Richard Johnson suggested) to get
> microseconds and divide them to get milliseconds, although I don't know how
> time critical your routines are.
> 
> If you're still looking for nanoseconds, I'm told you can use
> clock_gettime() but it's still quite unavailable (I've never seen it myself,
> yet).. however even if it was available you possibly wouldn't get a very
> high resolution from it with current systems..
>
clock_gettime() is available in the hard realtime extensions like RTLinux .
The clock resolution is limited to 32ns though - and atleast on X86 I don't
think there is a way to get below that.

hofrat 
