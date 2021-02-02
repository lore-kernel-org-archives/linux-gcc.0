From: Willy Tarreau <w@1wt.eu>
Subject: Re: Alternative compilers to GCC/Clang
Date: Tue, 2 Feb 2021 06:33:08 +0100
Message-ID: <20210202053307.GB28542@1wt.eu>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
Reply-To: linux-kernel@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amy Parker <enbyamy@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org

Hi Amy,

On Mon, Feb 01, 2021 at 03:31:49PM -0800, Amy Parker wrote:
> Hello! My name's Amy. I'm really impressed by the work done to make
> Clang (and the LLVM toolchain overall) able to compile the kernel.
> Figured I might as well donate my monkey hours to helping make it run
> on other compilers as well. I haven't been able to find any that use
> the same arguments structure as GCC and Clang (read: you can pass it
> in as CC=compilername in your $MAKEOPTS). Any compilers along that
> route anyone here has worked with that I could work with?

If you're interested, you should have a look at TCC (tiny CC) :

     https://repo.or.cz/tinycc.git

It compiles extremely fast, implements some subsets of gcc (a few
attributes for example), but is far from being able to compile a kernel
(at least last time I checked). Its speed makes it very convenient for
development. I made some efforts to make haproxy support it (and provided
some fixes to tcc) as it compiles the whole project in 0.5 second instead
of ~10 seconds with a modern gcc. It could probably compile a kernel in
15-20 seconds if properly supported, and this could be particularly handy
for development and testing.

Regards,
Willy
