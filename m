From: David Wuertele <dave-gnus@bfnet.com>
Subject: Repost: gcc cross mips output sizes too big
Date: Wed, 15 Dec 2004 04:15:54 -0800
Message-ID: <m3ekhrg3k5.fsf@bfnet.com>
References: <m37joqznoj.fsf@bfnet.com>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org

It's been a month and I still haven't found any answers.  Anyone here
know why object files have grown significantly since 2.95.3?

I've been using crosstool-generated gcc-3.3.3 to build my mipsel
targets, and I find that the file sizes are ginormous.  After
stripping the objects, I get file sizes that are up to TWICE as large
as similarly generated gcc-2.96 code.  Do these sizes not look out of
line?

   bytes          gcc-3.3.3 generated files
  -------       --------------------------------
  1884160	/lib/libc-2.3.2.so
  1257472	/lib/libstdc++.so.5.0.5
  1048576	/usr/local/lib/libfreetype.so.1314.0.0.10
  1036288	/bin/busybox
  1011712	/bin/bash

   bytes          gcc-2.96 generated files
  -------       --------------------------------
  1531904	/lib/libc-2.2.4.so
  532480	/lib/libstdc++-3-libc6.2-2-2.10.0.so
  495616	/usr/local/lib/libfreetype.so.1314.0.0.10
  462848	/bin/busybox
  847872	/bin/bash

Compiling with -Os helps, but doesn't get close to the file sizes I
saw with my older cross-compiler.  It seems strange to me that moving
to a newer compiler will reduce the number of programs I can ship in
my little NAND flash.

Is there some way to generate a more efficient cross-compiler?

Thanks,
Dave

