From: Willy Tarreau <w@1wt.eu>
Subject: Re: Alternative compilers to GCC/Clang
Date: Tue, 2 Feb 2021 22:00:39 +0100
Message-ID: <20210202210039.GB29751@1wt.eu>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
 <20210202201920.GA18106@zn.tnic>
Reply-To: linux-kernel@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210202201920.GA18106@zn.tnic>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Amy Parker <enbyamy@gmail.com>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Feb 02, 2021 at 09:19:20PM +0100, Borislav Petkov wrote:
> On Tue, Feb 02, 2021 at 11:11:32AM -0800, Amy Parker wrote:
> > On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > > > It compiles extremely fast, implements some subsets of gcc (a few
> > > > attributes for example), but is far from being able to compile a kernel
> > >
> > > Well, we'll see what I can do with that. :)
> > 
> > Well, just installed it and tried building the kernel. Fails every file. :)
> > 
> > It's definitely something to work towards - but I don't know if kernel
> > advancements requiring newer GCC versions will go slow enough to allow
> > TCC improvements to arise. This isn't just something like with Clang
> > where a few tweaks to files and to Clang itself did the trick.
> 
> Maybe this'll help you find something to do:
> 
> https://www.youtube.com/watch?v=iU0Z0vBKrtQ
> 
> Yes, it would be lovely to be able to compile the kernel with tcc but it
> is not going to be trivial.

In any case there will always be numerous limitations, but at least being
able to perform the basic build check with limited options could save quite
some time to many developers. Using gcc once the tcc-based "typo check"
passes would already be a nice start. Getting the kernel to boot would
indeed be a huge step forward! In haproxy we can only build with threading
disabled and it works slowly but sufficiently for basic tests and printf-
based debugging. It's convenient for bisecting certain bugs.

Thanks for the video Boris, I wasn't aware of it, definitely interesting!

Willy
