From: "Nate" <nate@uniwest.com>
Subject: Re: Measure time
Date: Wed, 8 May 2002 09:25:29 -0700
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <001801c1f6ac$f7fac860$4501a8c0@uniwest.com>
References: <200205081200.g48C0a805476@hofr.at> <004401c1f6a7$98f06ff0$e310f43e@manowar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Serguei I. Ivantsov" <admin@gsc-game.kiev.ua>
Cc: linux-gcc@vger.kernel.org


With you can get system time and then use the millisecond member in Win32...

<code>

SYSTEMTIME systm;

GetSystemTime(&systm);

/*
Can access members of the structure

systm.wMilliseconds
systm.wSecond
systm.wMinute
systm.wHour

... and yet more members ...
*/

</code>

~ Nate




----- Original Message -----
From: "Serguei I. Ivantsov" <admin@gsc-game.kiev.ua>
To: "Der Herr Hofrat" <der.herr@mail.hofr.at>
Cc: <linux-gcc@vger.kernel.org>; <linux-kernel@vger.kernel.org>
Sent: Wednesday, May 08, 2002 8:46 AM
Subject: Re: Measure time


> Is there any function like GetTickCount() in M$ Win32 that retrieves time
in
> milliseconds?
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
>
> > > Hello!
> > >
> > > Is there any function for high precision time measuring.
> > > time() returns only in second. I need nanoseconds.
> > >
> > you can directly read the TSC but that will not realy give you
nanoseconds
> > resolution as the actual read access even on a PIII/1GHz is going to
take
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
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

