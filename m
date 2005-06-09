From: Charlie Zender <zender@uci.edu>
Subject: Which -march/tune flags for Xeon processor?
Date: Wed, 08 Jun 2005 21:17:41 -0700
Message-ID: <d88fkt$367$1@sea.gmane.org>
Reply-To: zender@uci.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc@vger.kernel.org

Hi,

I have a dual Intel Xeon workstation which I want to tune for GCC.
What -march and -mtune flags should I call GCC with to optimize 
performance? None of the simpleton options that I recognize (pentium2,
pentium3, etc.) appear to recognize the chip's "Xeon" nature.
So here's is the /proc/cpuinfo and any help would be appreciated.

Thanks,
Charlie

zender@soot:~/nco/bld$ more /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Xeon(TM) CPU 2.80GHz
stepping        : 7
cpu MHz         : 2791.996
cache size      : 512 KB
physical id     : 0
siblings        : 2
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca 
cmov pat pse36 clflush d
ts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 5521.40

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Xeon(TM) CPU 2.80GHz
stepping        : 7
cpu MHz         : 2791.996
cache size      : 512 KB
physical id     : 0

-- 
Charlie Zender, surname@uci.edu, Department of Earth System Science
University of California, Irvine CA 92697-3100. Tel: (949) 824-2987

