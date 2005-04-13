From: John Lenz <lenz@cs.wisc.edu>
Subject: Re: [Crosspost] GNU/Linux userland?
Date: Wed, 13 Apr 2005 20:36:14 +0000
Message-ID: <1113424574l.5708l.0l@hydra>
References: <425D75AF.7080802@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-gcc-owner@vger.kernel.org>
In-reply-to: <425D75AF.7080802@gmx.de>
Content-disposition: inline
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: Oliver Korpilla <Oliver.Korpilla@gmx.de>
Cc: debian-kernel@lists.debian.org, debian-toolchain@lists.debian.org, linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/13/05 14:40:31, Oliver Korpilla wrote:
> Hello!
> 
> I wondered if there is a project or setup that does allow me to build a  
> GNU/Linux userland including kernel, build environment, basic tools with  
> a single script just as you can in NetBSD (build.sh) or FreeBSD (make  
> world).
> 

You might also look at www.openembedded.org  It has support for cross  
compiling, and with one command can build an entire userland.  Not sure if  
it is exactly a fit for what you want to do, but it seems very close.

John

