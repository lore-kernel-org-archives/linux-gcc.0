From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Subject: Re: Kernel Cross Compiling
Date: Tue, 17 Feb 2004 14:26:54 +0100 (CET)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.55.0402171421080.8356@jurand.ds.pg.gda.pl>
References: <20040213205743.GA30245@MAIL.13thfloor.at>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20040213205743.GA30245@MAIL.13thfloor.at>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Poetzl <herbert@13thfloor.at>
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

On Fri, 13 Feb 2004, Herbert Poetzl wrote:

>    mips/mips64:
> 	seem to use the 'obsoleted' -mcpu= option
> 	which results in a cc1: error: invalid option 
> 	`cpu=<cpu-here>'

 FYI, this has been addressed in the MIPS CVS tree not so long ago, so
changes are not merged to the mainline yet.  Actually, even the CVS
version isn't fully complete yet -- a small update is still pending
approval.  The problem isn't related to doing a build with cross-tools --
it happens when building natively as well.

 Otherwise, cross-compilation is the usual way of doing builds for MIPS
and it works in general.

-- 
+  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
+--------------------------------------------------------------+
+        e-mail: macro@ds2.pg.gda.pl, PGP key available        +
