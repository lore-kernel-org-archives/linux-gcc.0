From: Lukasz Michal Rak <L.Rak@elka.pw.edu.pl>
Subject: Re: x86 D flag: what's its status thru the program?
Date: Mon, 5 Jul 2004 19:19:06 +0200 (CEST)
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.58.0407051912010.9712@mion.elka.pw.edu.pl>
References: <20040704213748.A796@natasha.ward.six>
 <Pine.GSO.4.58.0407051519010.27449@mion.elka.pw.edu.pl>
 <20040705222647.A17650@natasha.ward.six>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <20040705222647.A17650@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: Lukasz Michal Rak <L.Rak@elka.pw.edu.pl>, gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

> >  The convention is that the D flag in IA32 is cleared. So if you call a
> > subroutine you have to clear D flag before making call.
>
> Do you mean that 'I have to clear the D flag if I had set it somewhere
> before?'  Else what is the sense of the convention?
Yes. Other code may assume that D is cleared and for example after calling
your code will not check state of D flag, so if you will left D flag set
this may cause errors.

> > The subroutine can change the state of D flag, but before returning
> > the routine has to clear the D flag.
>
> If the subroutine can change the flag, that it will violate the
> convention, won't it?  And what is the strength of the convention,
> again?
>
Subroutine can change the D flag, but before exiting must clear it.

The convention should make you free from checking the state of flag
and clearing at the beginning of your code.

> >  Hope I helped.
>
> Thanks, but I still don't understand something.  Again: if every
> procedure keeps the flag clear at exit, then why the same every
> procedure clears it at entry?  In a suspicion, that caller has changed
> the flag against the rules?
Just to be sure that the D flag is cleared. The convetion is one thing and
reality other.


Lukasz
