From: Amy Parker <enbyamy@gmail.com>
Subject: Re: Alternative compilers to GCC/Clang
Date: Tue, 2 Feb 2021 08:26:02 -0800
Message-ID: <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
Mime-Version: 1.0
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUPSf5IONoMjH7eJPdjOKIHOgkvLOpGL4eqwWCbjGqQ=;
        b=VnsLZMaMRaxj7WfTbrUjXcfUBtOJvRdty0dDO+U2Eh9+5DIogmRJs8nsGV+0p1ppBm
         z53Se1utHs8QgVHjuWDH6rTIxGRNUl4Mwgt1m+FGzRCurII7IoX6z7a3Y+10kvzwPBTG
         6czCsyV3zX4mKbUm1CvSJKZGeVwiJz9fqC80p7FSf5H4cX972oCrZqMOYWwynmDyR6Ks
         mgl3jSagE26iDArQM9FzC4fuys07ib4rGC7RG13HIeD8lxBioUz7JWft/P5hGRY7fyeW
         NjF4CTpfGSmzygDz+72Cwva1CxHj68LV54H02Hb8MKc1kJ6j7NIIkibSG0U0vVgj8vnT
         Bf6g==
In-Reply-To: <20210202053307.GB28542@1wt.eu>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Mon, Feb 1, 2021 at 9:33 PM Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Amy,
>
> On Mon, Feb 01, 2021 at 03:31:49PM -0800, Amy Parker wrote:
> > Hello! My name's Amy. I'm really impressed by the work done to make
> > Clang (and the LLVM toolchain overall) able to compile the kernel.
> > Figured I might as well donate my monkey hours to helping make it run
> > on other compilers as well. I haven't been able to find any that use
> > the same arguments structure as GCC and Clang (read: you can pass it
> > in as CC=compilername in your $MAKEOPTS). Any compilers along that
> > route anyone here has worked with that I could work with?
>
> If you're interested, you should have a look at TCC (tiny CC) :
>
>      https://repo.or.cz/tinycc.git

Thank you for linking this! Wasn't able to find this git repository
for it - only binaries for nonfree operating systems (yuck).

>
> It compiles extremely fast, implements some subsets of gcc (a few
> attributes for example), but is far from being able to compile a kernel

Well, we'll see what I can do with that. :)

> (at least last time I checked). Its speed makes it very convenient for
> development. I made some efforts to make haproxy support it (and provided
> some fixes to tcc) as it compiles the whole project in 0.5 second instead
> of ~10 seconds with a modern gcc. It could probably compile a kernel in
> 15-20 seconds if properly supported, and this could be particularly handy
> for development and testing.

Oh wow, yeah, that would be great. Thank you for pointing this out!
Compiling the kernel in 15-20 seconds instead of the current *couple
minutes* would definitely be great.

>
> Regards,
> Willy

Best regards,
Amy Parker
(she/her/hers)
