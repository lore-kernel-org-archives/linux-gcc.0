From: Willy Tarreau <w@1wt.eu>
Subject: Re: Alternative compilers to GCC/Clang
Date: Tue, 2 Feb 2021 22:41:01 +0100
Message-ID: <20210202214101.GA29871@1wt.eu>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
 <20210202201920.GA18106@zn.tnic>
 <20210202210039.GB29751@1wt.eu>
 <20210202212048.GG18075@zn.tnic>
Mime-Version: 1.0
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210202212048.GG18075@zn.tnic>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Amy Parker <enbyamy@gmail.com>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org, Michael Matz <matz@suse.de>

On Tue, Feb 02, 2021 at 10:20:48PM +0100, Borislav Petkov wrote:
> It would be good to start forward-porting and integrating some of the
> fixes and even extend tcc to handle some of the gnuisms we're using in
> the kernel so that we can build the kernel with it too.

I agree. And the team is responsive and shows great consideration for
patches.

> I can imagine having CONFIG_TCC - as long as that doesn't get too
> intrusive and get in the way of things - and those who wanna build the
> kernel with it, can enable it. For example...

I like this idea. It's way better than having to implement everything
at once or degrade some code just to make it build. It could be solved
at config time by automatically excluding some features.

It should also be less of a hassle than dealing with many gcc versions
because if we see it as a development speed up tool we can easily accept
that we occasionaly break compatibility with older of its versions and
that those who want to use it just rebuild the latest one (it's trivial
and fast, basically "make" and you're done, not the typical toolchain
experience). You don't care if it doesn't work for one week, you're not
supposed to ship any form of official code built with it anyway. It's
just an aid, and a nice one.

Willy
