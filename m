From: Borislav Petkov <bp@alien8.de>
Subject: Re: Alternative compilers to GCC/Clang
Date: Tue, 2 Feb 2021 21:19:20 +0100
Message-ID: <20210202201920.GA18106@zn.tnic>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1612297165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=Ee3tYDfp3QeWVA1ZBYRXshE4otzH4zb09kl47xr1pHE=;
        b=SDRCfxlXmSk5o5zrc2gZpWTT4s8Dc+LpNzMhgAzU+Qw8wLmLMcElN1KwJwFQ364IIFRdFw
        rl8olf75MSZYAIBVJ4JLoHuaGI4xz62anXU1RRuW31+nQ8Skw2Den0ZgHajsIOGIvxFWBJ
        sFgKhRoJmI2Al0F1rYGRLvs/qD651a8=
Content-Disposition: inline
In-Reply-To: <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amy Parker <enbyamy@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org, Willy Tarreau <w@1wt.eu>

On Tue, Feb 02, 2021 at 11:11:32AM -0800, Amy Parker wrote:
> On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > > It compiles extremely fast, implements some subsets of gcc (a few
> > > attributes for example), but is far from being able to compile a kernel
> >
> > Well, we'll see what I can do with that. :)
> 
> Well, just installed it and tried building the kernel. Fails every file. :)
> 
> It's definitely something to work towards - but I don't know if kernel
> advancements requiring newer GCC versions will go slow enough to allow
> TCC improvements to arise. This isn't just something like with Clang
> where a few tweaks to files and to Clang itself did the trick.

Maybe this'll help you find something to do:

https://www.youtube.com/watch?v=iU0Z0vBKrtQ

Yes, it would be lovely to be able to compile the kernel with tcc but it
is not going to be trivial.

Good luck.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
