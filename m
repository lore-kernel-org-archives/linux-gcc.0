From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Tue, 21 Dec 2004 03:46:37 +0500
Message-ID: <20041221034637.A13027@natasha.ward.six>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221024810.B8330@natasha.ward.six> <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu> <047968C8-52D3-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221032621.D8330@natasha.ward.six> <0E23C1A3-52D7-11D9-9FB0-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0E23C1A3-52D7-11D9-9FB0-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Mon, Dec 20, 2004 at 05:32:39PM -0500
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>

On Mon, Dec 20, 2004 at 05:32:39PM -0500, Andrew Pinski wrote:
> 
> On Dec 20, 2004, at 5:26 PM, Denis Zaitsev wrote:
> 
> > On Mon, Dec 20, 2004 at 05:03:45PM -0500, Andrew Pinski wrote:
> >>
> >> This one is better and should work.
> >>
> >>
> >> If it does not report the errors please as it will help to fix the
> >> problem.
> >
> > Yes, this patch seems to work, thanks.  But the compiler still
> > complains about undeclared atoi.  Maybe it worth something to include
> > <stdlib.h> somewhere?
> 
> Yes, this is what I applied to both the mainline and the 3.4 branch.

Ok.  Does it means that something alike should be applied for the
files, which are including coretypes.h and tm.h for now?
