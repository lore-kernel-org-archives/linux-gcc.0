From: Nickolay <nickolay@protei.ru>
Subject: initrd support in 2.6 kernel
Date: Wed, 13 Apr 2005 21:33:54 +0400
Message-ID: <425D5802.3040200@protei.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc@vger.kernel.org

Hallo Guys!

I has initrd, that nice loaded by all 2.4 kernels.
But 2.6.9 kernel has some difference in loading initrd(as i discovered).
This warning produced by kernel on boot:

...SKIP...
Kernel command line: console=ttyS0,115200 root=/dev/ram0 
initrd=0x00800000,32M
...SKIP...
checking if image is initramfs...it isn't (ungzip failed); looks like an 
initrd
Freeing initrd memory: 32768K
... SKIP...
RAMDISK driver initialized: 16 RAM disks of 32768K size 1024 blocksize
...SKIP...
RAMDISK: Couldn't find valid RAM disk image starting at 0.
Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(1,0)


Maybe troubles in kernel command line? But this command line work fine 
on 2.4 kernels.

