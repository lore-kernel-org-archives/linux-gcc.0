From: "Simon Butcher" <pickle@alien.net.au>
Subject: RE: Measure time
Date: Thu, 9 May 2002 02:51:42 +1000
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <NCBBLGAKEDCMNBGMONMPMEEHCKAA.pickle@alien.net.au>
References: <004401c1f6a7$98f06ff0$e310f43e@manowar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <004401c1f6a7$98f06ff0$e310f43e@manowar>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Serguei I. Ivantsov" <admin@gsc-game.kiev.ua>, Der Herr Hofrat <der.herr@mail.hofr.at>
Cc: linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

ftime() will return milliseconds, but it's considered an obsolete function.
You could use gettimeofday() (as Richard Johnson suggested) to get
microseconds and divide them to get milliseconds, although I don't know how
time critical your routines are.

If you're still looking for nanoseconds, I'm told you can use
clock_gettime() but it's still quite unavailable (I've never seen it myself,
yet).. however even if it was available you possibly wouldn't get a very
high resolution from it with current systems..

 - Simon

> -----Original Message-----
> From: linux-gcc-owner@vger.kernel.org
> [mailto:linux-gcc-owner@vger.kernel.org]On Behalf Of Serguei I. Ivantsov
> Sent: Thursday, 9 May 2002 01:47
> To: Der Herr Hofrat
> Cc: linux-gcc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: Measure time
>
>
> Is there any function like GetTickCount() in M$ Win32 that
> retrieves time in
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
> nanoseconds
> > resolution as the actual read access even on a PIII/1GHz is
> going to take
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
>

