From: Oliver Korpilla <Oliver.Korpilla@gmx.de>
Subject: [Crosspost] GNU/Linux userland?
Date: Wed, 13 Apr 2005 21:40:31 +0200
Message-ID: <425D75AF.7080802@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: debian-kernel@lists.debian.org, debian-toolchain@lists.debian.org, linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

I wondered if there is a project or setup that does allow me to build a 
GNU/Linux userland including kernel, build environment, basic tools with 
a single script just as you can in NetBSD (build.sh) or FreeBSD (make 
world).

I do not refer to a step-by-step instruction like "Linux From Scratch" 
(which I do find commendable, but is not quite the same), but an 
automated, cross-compilation aware foundation for a Linux system.

I found one of the great things about NetBSD which I miss in Linux that 
I can generate a baseline from source that quickly. It would mix greatly 
with the package management systems for Linux, like apt or rpm, which 
could be used for all other stuff, like X11.

I'd say such a system should include (not complete, just in my opinion):
* Kernel 2.6.x
* Sample generic kernel configurations (like GENERIC etc. in NetBSD)
* GNU Toolchain (gcc, gdb, glibc, ...)
* GNU make
* udev-Support oder eine /dev-Generierungsskript
* Bash
* basic networking tools
* an interpreter for the language the build script is in (Sh, Python, ...)
* Security (PAM support, Shadow passwords)
* System V init

It should contain anything you need to build a baseline from within the 
baseline.
It should be a minimal setup.
It should include cross-compilation support.

It would be imaginable to have similar scripts to create embedded 
development host setup (toolchains and libs) and an embedded development 
target baseline (uclibc, other libraries, busybox).

Is there something that at least partly is in that direction?
Is there a need for something like this?

I'm asking out of genuine curiosity, and hoping for answers.

Please CC me, I'm in none of these lists!

Thanks and with kind regard,
Oliver Korpilla
