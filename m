From: "Mathur, Shobhit" <Shobhit_mathur@adaptec.com>
Subject: gcc: linker input file unused since linking not done
Date: Thu, 20 Mar 2003 06:36:26 +0530
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3E791412.4A10F9A1@adaptec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

Hello,

I am facing a problem in compiling my source code with the library
[static library ], which I have created.
Upon specifying the appropriate Include-paths,  Lib-paths, and the
appropriate ".a" to which the programs
should link, I get the error from gcc as mentioned in the subject :

gcc: -ltcfg: linker input file unused since linking not done

where, ltcfg  points to  libtcfg.a, which is a static library generated
by me, whose path is specified by  the "-L" directive.

I would like to know why the above message  appears from  gcc.  If so,
what is the remedy to this problem ?

- Please do let me know what is missing

- Thank you

- Shobhit
