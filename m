From: "Richard B. Johnson" <root@chaos.analogic.com>
Subject: Re: Measure time
Date: Wed, 8 May 2002 08:21:00 -0400 (EDT)
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <Pine.LNX.3.95.1020508081422.3374A-100000@chaos.analogic.com>
References: <abaokj$ugl$1@news.lucky.net>
Reply-To: root@chaos.analogic.com
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <abaokj$ugl$1@news.lucky.net>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Serguei I. Ivantsov" <administrator@svitonline.com>
Cc: linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 8 May 2002, Serguei I. Ivantsov wrote:

> Hello!
> 
> Is there any function for high precision time measuring.
> time() returns only in second. I need nanoseconds.
> 
> --
>  Regards,
>   Serguei I. Ivantsov
>    GSC Game World
> 

gettimeofday() returns seconds/microseconds. If you need nanoseconds,
you can read CPU clock cycles in Intel machines with (assembly) rdtsc
instructions and convert, based upon the CPU clock.

If you really need nanosecond resolution in code that may be
interrupted or preempted at any time, you are in a world of hurt.
I suggest you review the requirement. You may need a TMS320C30 or
similar DSP standing alone.

Cheers,
Dick Johnson

Penguin : Linux version 2.4.18 on an i686 machine (797.90 BogoMips).

                 Windows-2000/Professional isn't.

