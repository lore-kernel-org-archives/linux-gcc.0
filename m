From: SoloCDM <deedsmis@aculink.net>
Subject: Re: Mistake With CPP File
Date: Fri, 02 Aug 2002 06:47:41 -0600
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3D4A7F6D.3446C6F5@cdm01.deedsmiscentral.net>
References: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net> <20020801070932.GA30472@schiele.local> <3D48F387.24495315@cdm01.deedsmiscentral.net> <20020801133342.GA32311@schiele.local>
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
> On Thu, Aug 01, 2002 at 02:38:32AM -0600, SoloCDM wrote:
>
> > Robert Schiele stated the following:
> >
> > > cout is in libstdc++. So either you have to call "g++ fig01_02.cpp" or
> > > "gcc -lstdc++ fig01_02.cpp".
> >
> > It worked -- Thanks!
> >
> > I couldn't help but notice how g++ linked all the way back to
> > colorgcc.  Although, colorgcc doesn't react like g++.  Colorgcc won't
> > create a.out.
> 
> Sorry, but I cannot see what you wanted to tell us with this
> paragraph.

It starts the linking (ln command) with /usr/bin/g++ -->
/etc/alternatives/g++ --> /usr/bin/colorg++ --> /usr/bin/colorgcc. 
G++ is acting as a link.  If executed in the same manner as g++ to
create an a.out file, without options, colorgcc doesn't execute like
g++.

> > What is gcc used for?  I noticed it seems to have some of the same
> > files or libraries as g++.
> 
> gcc and g++ are the same, but gcc uses C as it's standard language,
> where g++ uses C++ as standard language and links standard C++
> libraries without the need to specify them explicitly.

Is the documentation on my system to know how to use different things
like "-lstdc++" with g++?  What would the files be?  I didn't find
anything in the man page.

-- 
Note: When you reply to this message, please include the mailing
      list and/or newsgroup address and my email address in To:

*********************************************************************
Signed,
SoloCDM