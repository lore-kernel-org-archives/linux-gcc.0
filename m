From: Maciej Zenczykowski <maze@cela.pl>
Subject: Re: 2.4.18 fork & defunct child.
Date: Tue, 18 Nov 2003 02:00:01 +0100 (CET)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0311180151490.11042-100000@gaia.cela.pl>
References: <3FB96718.20103@media-solutions.ie>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3FB96718.20103@media-solutions.ie>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Whyte <keith@media-solutions.ie>
Cc: Edgar Toernig <froese@gmx.de>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-admin@vger.kernel.org

> { strace listing deleted, see 
> http://marc.theaimsgroup.com/?l=linux-kernel&m=106905386725308&w=2 }

well, I strace'd by glibc 2.3.2 system /bin/true and it doesn't fork and 
doesn't open proc (first place the two straces differ).  Maybe your 
libraries have been hacked - seems the most likely to me - if this is 
happening for all programs than the libc is likely bad...

I can't understand what it is opening /proc/.../exe for and I don't 
understand what the ///////// in there is for (I think more than 2 
consecutive slashes are illegal in POSIX, not sure though, never use more 
than 2 :) )

On a side note /bin/true should take up somewhere like 10 bytes asm code - 
what the hell is that thing doing more than exit(1) for? it shouldn't open 
any files at all... what a bad design (and true --help and true --version 
don't work anyway... duh!)

perhaps try ltrace'ing /bin/true and see what that prints out?

Cheers,
MaZe.


