From: Peter Chubb <peter@chubb.wattle.id.au>
Subject: Re: Kernel Cross Compiling
Date: Mon, 16 Feb 2004 11:03:13 +1100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <16432.2241.906730.769445@wombat.chubb.wattle.id.au>
References: <20040213205743.GA30245@MAIL.13thfloor.at>
	<16429.16944.521739.223708@napali.hpl.hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <16429.16944.521739.223708@napali.hpl.hp.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: davidm@hpl.hp.com
Cc: Herbert Poetzl <herbert@13thfloor.at>, linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org

>>>>> "David" == David Mosberger <davidm@napali.hpl.hp.com> writes:

>>>>> On Fri, 13 Feb 2004 21:57:43 +0100, Herbert Poetzl <herbert@13thfloor.at> said:
Herbert> I got all headers fixed, except for the ia64, which still
Herbert> doesn't work

David> Something sounds wrong here. You shouldn't have to patch
David> headers.

David> A recipe for building ia32->ia64 cross-toolchain on Debian can
David> be found here:

David>  http://www.gelato.unsw.edu.au/IA64wiki/CrossCompilation

He's trying to use gcc 3.3.2 which isn't packaged in toolchain-source
yet.  And he's running on a RedHat-like system.

And there's currently a problem:  To build gcc you need access to an
appropriate libc6 header package; dpkg-cross refuses to install one
without linux-kernel-headers-cross-ia64; but will also not install
linux-kernel-headers.  You need the patch at
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=222168

Peter C
