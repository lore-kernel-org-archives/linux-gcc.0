From: "H.J. Lu" <hongjiu.lu@intel.com>
Subject: The Linux binutils 2.19.51.0.1 is released
Date: Tue, 6 Jan 2009 10:32:43 -0800
Message-ID: <20090106183243.GA27036@lucon.org>
Reply-To: "H.J. Lu" <hjl.tools@gmail.com>
Mime-Version: 1.0
Return-path: <gcc-return-150763-gcc=m.gmane.org@gcc.gnu.org>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>, gcc@gcc.gnu.org

This is the beta release of binutils 2.19.51.0.1 for Linux, which is
based on binutils 2009 0106 in CVS on sourceware.org plus various
changes. It is purely for Linux.

All relevant patches in patches have been applied to the source tree.
You can take a look at patches/README to see what have been applied and
in what order they have been applied.

Starting from the 2.18.50.0.4 release, the x86 assembler no longer
accepts

	fnstsw %eax

fnstsw stores 16bit into %ax and the upper 16bit of %eax is unchanged.
Please use

	fnstsw %ax

Starting from the 2.17.50.0.4 release, the default output section LMA
(load memory address) has changed for allocatable sections from being
equal to VMA (virtual memory address), to keeping the difference between
LMA and VMA the same as the previous output section in the same region.

For

.data.init_task : { *(.data.init_task) }

LMA of .data.init_task section is equal to its VMA with the old linker.
With the new linker, it depends on the previous output section. You
can use

.data.init_task : AT (ADDR(.data.init_task)) { *(.data.init_task) }

to ensure that LMA of .data.init_task section is always equal to its
VMA. The linker script in the older 2.6 x86-64 kernel depends on the
old behavior.  You can add AT (ADDR(section)) to force LMA of
.data.init_task section equal to its VMA. It will work with both old
and new linkers. The x86-64 kernel linker script in kernel 2.6.13 and
above is OK.

The new x86_64 assembler no longer accepts

	monitor %eax,%ecx,%edx

You should use

	monitor %rax,%ecx,%edx

or
	monitor

which works with both old and new x86_64 assemblers. They should
generate the same opcode.

The new i386/x86_64 assemblers no longer accept instructions for moving
between a segment register and a 32bit memory location, i.e.,

	movl (%eax),%ds
	movl %ds,(%eax)

To generate instructions for moving between a segment register and a
16bit memory location without the 16bit operand size prefix, 0x66,

	mov (%eax),%ds
	mov %ds,(%eax)

should be used. It will work with both new and old assemblers. The
assembler starting from 2.16.90.0.1 will also support

	movw (%eax),%ds
	movw %ds,(%eax)

without the 0x66 prefix. Patches for 2.4 and 2.6 Linux kernels are
available at

http://www.kernel.org/pub/linux/devel/binutils/linux-2.4-seg-4.patch
http://www.kernel.org/pub/linux/devel/binutils/linux-2.6-seg-5.patch

The ia64 assembler is now defaulted to tune for Itanium 2 processors.
To build a kernel for Itanium 1 processors, you will need to add

ifeq ($(CONFIG_ITANIUM),y)
	CFLAGS += -Wa,-mtune=itanium1
	AFLAGS += -Wa,-mtune=itanium1
endif

to arch/ia64/Makefile in your kernel source tree.

Please report any bugs related to binutils 2.19.51.0.1 to
hjl.tools@gmail.com

and

http://www.sourceware.org/bugzilla/

Changes from binutils 2.19.50.0.1:

1. Update from binutils 2009 0106.
2. Support AVX Programming Reference (December, 2008)
2. Encode AVX insns with 2byte VEX prefix if possible.
4. Add .s suffix support to swap register operands to x86 assembler.
5. Properly select NOP insns for code alignment in x86 assembler.
6. Fix 2 symbol visibility linker bugs.  PRs 9676/9679.
7. Fix an ia64 linker relaxation bug.  PR 7036.
8. Fix a symbol versioning bug. PR 7047.
9. Fix unitialized data in linker.  PR 7028.
10. Avoid a linker crash on bad input.  PR 7023.
11. Fix a linker memory leak.  PR 7012.
12. Fix strip/objcopy crash on PT_GNU_RELRO.  PR 7011.
13. Improve MacOS support.
14. Fix a COFF linker bug.  PR 6945.
15. Add LM32 support.
16. Fix various arm bugs.
17. Fix various avr bugs.
18. Fix various CR16  bugs.
19. Fix various cris bugs.
20. Fix various m32c bugs.
21. Fix various m68k bugs.
22. Fix various mips bugs.
23. Fix various ppc bugs.
24. Fix various s390 bugs.
25. Fix various sparc bugs.
26. Fix various spu bugs.
27. Fix various xtensa bugs.

The file list:

1. binutils-2.19.51.0.1.tar.bz2. Source code.
2. binutils-2.19.50.0.1-2.19.51.0.1.diff.bz2. Patch against the
   previous beta source code.
3. binutils-2.19.51.0.1.i686.tar.bz2. IA-32 binary tar ball for RedHat
   EL 4.
4. binutils-2.19.51.0.1.ia64.tar.bz2. IA-64 binary tar ball for RedHat
   EL 4.
5. binutils-2.19.51.0.1.x86_64.tar.bz2. X64_64 binary tar ball for RedHat
   EL 4.

The primary sites for the beta Linux binutils are:

1. http://www.kernel.org/pub/linux/devel/binutils/

Thanks.


H.J. Lu
hjl.tools@gmail.com
01/06/2009
