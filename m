From: "Calin A. Culianu" <calin@ajvar.org>
Subject: Re: Measure time
Date: Wed, 8 May 2002 12:26:03 -0400 (EDT)
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33L2.0205081224390.9196-100000@rtlab.med.cornell.edu>
References: <200205081200.g48C0a805476@hofr.at>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <200205081200.g48C0a805476@hofr.at>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Der Herr Hofrat <der.herr@mail.hofr.at>
Cc: "Serguei I. Ivantsov" <administrator@svitonline.com>, linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 8 May 2002, Der Herr Hofrat wrote:

> > Hello!
> >
> > Is there any function for high precision time measuring.
> > time() returns only in second. I need nanoseconds.
> >
> you can directly read the TSC but that will not realy give you nanoseconds
> resolution as the actual read access even on a PIII/1GHz is going to take
> up to a few 100 nanoseconds, and depending on what you want to time
> stamp the overall jitter of that code can easaly be in the
> range of a microsecond.
>
> There are some hard-realtime patches to the Linux kernel that will
> allow time precission of aprox. 1us (the TSC has a precission of 32ns)
> but I don't think you can get below that without dedicated hardware.
>
> for RTLinux check at ftp://ftp.rtlinux.org/pub/rtlinux/

I recommend RTAI instead.  It's more feature-rich, and works with newer
kernels.. the url is http://www.aero.polimi.it/~rtai/, or
http://www.rtai.org.

-Calin

>
> hofrat
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>

