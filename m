From: george anzinger <george@mvista.com>
Subject: Re: Measure time
Date: Wed, 08 May 2002 09:40:21 -0700
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <abbkkj$kea$2@main.gmane.org>
References: <200205081200.g48C0a805476@hofr.at> <004401c1f6a7$98f06ff0$e310f43e@manowar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Serguei I. Ivantsov" <admin@gsc-game.kiev.ua>
Cc: Der Herr Hofrat <der.herr@mail.hofr.at>, linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

"Serguei I. Ivantsov" wrote:
> 
> Is there any function like GetTickCount() in M$ Win32 that retrieves time in
> milliseconds?

The kernel provides gettimeofday() which give micro seconds AND is
usually quite accurate.  On machines of about 800 MHZ and better you
can, sometimes, even get the same value on back to back readings.

The high-res-timers patch (see sig. below) implements the POSIX clocks
and timers which return values in nanoseconds, but the resolution, due
to jitter and such is still in the range of micro seconds.

If, on the other hand, you are trying to measure execution time of some
task that blocks during that time, you are in a world of hurt.  The
kernel allocates 1/HZ chunks of elapsed time to what ever task it finds
running at the 1/HZ tick.  There is NO attempt by the kernel to refine
this measurement.

George
> 
> --
>  Regards,
>   Serguei I. Ivantsov
> 
> ----- Original Message -----
> From: "Der Herr Hofrat" <der.herr@mail.hofr.at>
> To: "Serguei I. Ivantsov" <administrator@svitonline.com>
> Cc: <linux-gcc@vger.kernel.org>; <linux-kernel@vger.kernel.org>
> Sent: Wednesday, May 08, 2002 3:00 PM
> Subject: Re: Measure time
> 
> > > Hello!
> > >
> > > Is there any function for high precision time measuring.
> > > time() returns only in second. I need nanoseconds.
> > >
> > you can directly read the TSC but that will not realy give you nanoseconds
> > resolution as the actual read access even on a PIII/1GHz is going to take
> > up to a few 100 nanoseconds, and depending on what you want to time
> > stamp the overall jitter of that code can easaly be in the
> > range of a microsecond.
> >
> > There are some hard-realtime patches to the Linux kernel that will
> > allow time precission of aprox. 1us (the TSC has a precission of 32ns)
> > but I don't think you can get below that without dedicated hardware.
> >
> > for RTLinux check at ftp://ftp.rtlinux.org/pub/rtlinux/
> >
> > hofrat
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
George Anzinger   george@mvista.com
High-res-timers:  http://sourceforge.net/projects/high-res-timers/
Real time sched:  http://sourceforge.net/projects/rtsched/
Preemption patch: http://www.kernel.org/pub/linux/kernel/people/rml
