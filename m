From: SoloCDM <deedsmis@aculink.net>
Subject: Re: Mistake With CPP File
Date: Thu, 01 Aug 2002 02:38:32 -0600
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3D48F387.24495315@cdm01.deedsmiscentral.net>
References: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net> <20020801070932.GA30472@schiele.local>
Reply-To: deedsmis@aculink.net, linux-gcc@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schiele <rschiele@uni-mannheim.de>
Cc: "Linux-GCC (Majordomo)" <linux-gcc@vger.kernel.org>

Robert Schiele stated the following:
> 
> On Wed, Jul 31, 2002 at 05:04:04AM -0600, SoloCDM wrote:
> > Recently I tried to compile fig01_02.cpp with Kernel 2.2.20 on Linux
> > Mandrake 8.0.  I used "gcc fig01_02.cpp" and received the following
> > errors:
> >
> > <user_account>/tmp/ccmeDWKS.o: In function `main':
> > <user_account>/tmp/ccmeDWKS.o(.text+0xf): undefined reference to
> > `cout'
> > <user_account>/tmp/ccmeDWKS.o(.text+0x14): undefined reference to
> > `ostream::operator<<(char const *)'collect2: ld returned 1 exit status
> >
> > Why didn't it work?
> 
> cout is in libstdc++. So either you have to call "g++ fig01_02.cpp" or
> "gcc -lstdc++ fig01_02.cpp".

It worked -- Thanks!

I couldn't help but notice how g++ linked all the way back to
colorgcc.  Although, colorgcc doesn't react like g++.  Colorgcc won't
create a.out.

What is gcc used for?  I noticed it seems to have some of the same
files or libraries as g++.

-- 
Note: When you reply to this message, please include the mailing
      list and/or newsgroup address and my email address in To:

*********************************************************************
Signed,
SoloCDM