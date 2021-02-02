From: Amy Parker <enbyamy@gmail.com>
Subject: Re: Alternative compilers to GCC/Clang
Date: Tue, 2 Feb 2021 11:11:32 -0800
Message-ID: <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu> <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ska71jiHojC54SOYCBQ1AKHCS3X3JTpfbQsFpLGOP0c=;
        b=raM/FPGkdCZz1KmHU8ngiCRO/kehkjF1I6X0oa9wNdobKMGo4aA8QtePyfzrV3qOKh
         UYXLRoV2aEd+AzB30u83r/xfF5WVOpp6ewx0gJNEofxz+Lw+JAk3m7SCIJPw7sAhE9jx
         XPPSTuoVfD2DzDxUXMu4h9QCVNCWAevZ7zw6G4vsX7ABq8r9VJL4pxHtN1ciQ8IhC3W5
         JFOuR8zn5ETP/GLmddvMJZNA83XyvfDapILkKj4YvRZDpB/F8S0E1AIy+R1B988+MVL/
         p/8PF5gtaOuA2ApfAQW/rBbqhwa4WpFMNllcYXO2XCJcKt0/0axs0y6YkyDL+fSWMt6p
         wPiQ==
In-Reply-To: <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > It compiles extremely fast, implements some subsets of gcc (a few
> > attributes for example), but is far from being able to compile a kernel
>
> Well, we'll see what I can do with that. :)

Well, just installed it and tried building the kernel. Fails every file. :)

It's definitely something to work towards - but I don't know if kernel
advancements requiring newer GCC versions will go slow enough to allow
TCC improvements to arise. This isn't just something like with Clang
where a few tweaks to files and to Clang itself did the trick.
