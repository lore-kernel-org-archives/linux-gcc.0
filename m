From: Keith Whyte <keith@media-solutions.ie>
Subject: Re: 2.4.18 fork & defunct child.
Date: Mon, 17 Nov 2003 18:26:00 -0600
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <3FB96718.20103@media-solutions.ie>
References: <1069053524.3fb87654286b5@ssl.buz.org> <3FB8E40F.EF61CA7@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3FB8E40F.EF61CA7@gmx.de>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edgar Toernig <froese@gmx.de>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-admin@vger.kernel.org

Edgar Toernig wrote:

{ strace listing deleted, see 
http://marc.theaimsgroup.com/?l=linux-kernel&m=106905386725308&w=2 }

>That is not normal /bin/true behaviour.  Sure your system
>isn't hacked?  Give the -f option to ptrace to see what the
>forked process is trying to do...  Compare the size of
>/bin/true with a known-good one.
>
>Ciao, ET.
>

I'm not sure. I should be running tripwire or something, this is the 
only one of my systems that doesn't run such a thing, as i have the  
firewall locked down and have been busy.
But it is true i accidently did iptables -F and it was left that way for 
a few days.

But this happens with any program, not just /bin/true, also the 
/bin/true on the root and chroot systems are identical. and with much 
interest i discovered, that if i unmount /proc, the problem goes away. aggh.

that is why it is not exhibiting itself in the chroot system, - no /proc.

I also remember that when this first happen nearly a year ago, some 
"unix engineer" at the ISP said, oh yeah that's because something in the 
ext2 filesystem header is corrupted.. i don't quite remember what he 
said exactly, something  that sounded so far fetched that i ignored it. 
does that ring any bells with anyone?

please help, ug, i hate having a linux system that's not reliable. feels 
like having a pet that's in pain or something.

btw,
/lib/libc.so.6 -> libc-2.2.5.so

Keith

(i'm cross-posting here to gcc and admin in the hopes of finding someone 
who has seen this, thanks!)


