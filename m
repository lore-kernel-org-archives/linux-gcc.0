From: Agri <agri@desnol.ru>
Subject: sigill (signal 4) on the i586 with binaries compiled on the i686
Date: Sun, 31 Aug 2003 17:32:19 +0400
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20030831173219.47582c42.agri@desnol.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

i have i686-pc-linux-gnu boxwith working linux system.
i'm trying to install linux on the i586
p100 8ram

this is my step by step tries

i have gcc-3.3 compiled for i686-pc-linux-gnu
i had configured and installed linux kernel 2.4.21 for i586,
it succesfully booting on the i586 box.

i had compiled and installed busybox. using it as init was failed.
i booted kernel with init=/bin/sash (standalone shell) - success.
every try to lunch any programm from that shell results in signal 4 (SIGILL).
it is not because of memory. I had tried to boot the same system on i686 box
with mem=8M kernel param - it's OK.

try to use -march=i586 on gcc-3.3 results in nothing.
i was build cross-compiler for gcc-2.95.3 for i586 with glibc-2.2.4 and tried to use it - nothing changed.

where is the problem? how to fix it?

Agri
