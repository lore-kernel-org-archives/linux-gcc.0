From: "H.J. Lu" <hongjiu.lu@intel.com>
Subject: The Linux binutils 2.19.51.0.8 is released.
Date: Wed, 3 Jun 2009 06:36:49 -0700
Message-ID: <20090603133649.GA26468@lucon.org>
Reply-To: "H.J. Lu" <hjl.tools@gmail.com>
Mime-Version: 1.0
Return-path: <gcc-return-154389-gcc=m.gmane.org@gcc.gnu.org>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>, gcc@gcc.gnu.org, Mat Hostetter <mat@lcs.mit.edu>, Warner Losh <imp@village.org>, linux-mips@linux-mips.org, Ralf

This is the beta release of binutils 2.19.51.0.8 for Linux, which is
based on binutils 2009 0603 in CVS on sourceware.org plus various
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

Please report any bugs related to binutils 2.19.51.0.8 to
hjl.tools@gmail.com

and

http://www.sourceware.org/bugzilla/

Changes from binutils 2.19.51.0.7:

1. Update from binutils 2009 0603.
2. Fix STT_GNU_IFUNC symbol with pointer equality.

Changes from binutils 2.19.51.0.6:

1. Update from binutils 2009 0601.
2. Update STT_GNU_IFUNC support. PR 10205.
3. Fix x86 asssembler Intel syntax regression with '$'. PR 10198.

Changes from binutils 2.19.51.0.5:

1. Update from binutils 2009 0529.
2. Rewrite STT_GNU_IFUNC, R_386_IRELATIVE and R_X86_64_IRELATIVE linker
support for STT_GNU_IFUNC symbols in shared library, dynamic executable
and static executable.
3. Add plugin support.
4. Improve spu support.

Changes from binutils 2.19.51.0.4:

1. Update from binutils 2009 0525.
2. Add STT_GNU_IFUNC, R_386_IRELATIVE and R_X86_64_IRELATIVE support to
assembler and linker.
3. Add LD_AS_NEEDED support to linker.
4. Remove AMD SSE5 support.
5. A new Intel syntax parser in x86 assembler.
6. Add DWARF discriminator support.
7. Add --64 support for x86 PE/COFF assembler.
8. Support common symbol with alignment for PE/COFF.
9. Improve gold support.
10. Improve arm support.
11. Improve mep support.
12. Improve mips support.
13. Improve ppc support.
14. Improve spu support.

Changes from binutils 2.19.51.0.3:

1. Update from binutils 2009 0418.
2. Remove EFI targets and use PEI targets for EFI. Add --file-alignment,
--heap, --image-base, --section-alignment, --stack and --subsystem command
line options for objcopy.  PR 10074.
3. Update linker to warn alternate ELF machine code.
4. Fix x86 linker TLS transition.  PR 9938.
5. Improve DWARF dumper to check relocations against STT_SECTION
symbol.
6. Guard DWARF dumper on bad DWARF input.
7. Add EM_ETPU and EM_SLE9X.  Reserve 3 ELF machine types for Intel.
8. Adding a linker missing entry symbol warning for -pie. PR 9970.
9. Make the -e option for linker to imply -u.  PR 6766.
10. Properly handle paging for PEI targets.
11. Fix assembler listing with input from stdin.
12. Update objcopy/string to generate symbol table if there is any
relocation in output.  PR 9945.
13. Require texinfo 4.7 for build.  PR 10039.
14. Add moxie support.
15. Improve gold support.
16. Improve AIX support.
17. Improve arm support.
18. Improve cris support.
19. Improve crx support.
20. Improve mips support.
21. Improve ppc support.
22. Improve s390 support.
23. Improve spu support.
24. Improve vax support.

Changes from binutils 2.19.51.0.2:

1. Update from binutils 2009 0310.
2. Fix strip on common symbols in relocatable file.  PR 9933.
3. Fix --enable-targets=all build.
4. Fix ia64 build with -Wformat-security.  PR 9874.
5. Add REGION_ALIAS support in linker script.
6. Add think archive support to readelf.
7. Improve DWARF support in objdump.
8. Improve alpha support.
9. Improve arm support.
10. Improve hppa support.
11. Improve m68k support.
12. Improve mips support.
13. Improve ppc support.
14. Improve xtensa support.
15. Add score 7 support.

Changes from binutils 2.19.51.0.1:

1. Update from binutils 2009 0204.
2. Support AVX Programming Reference (January, 2009)
3. Improve .s suffix support in x86 disassembler.
4. Add --prefix/--prefix-strip for objdump -S.  PR 9784.
5. Change "ld --as-needed" to resolve undefined references in DSO.
6. Add -Ttext-segment to ld to set address of text segment.
7. Fix "ld -r --gc-sections --entry" crash with COMDAT group.  PR 9727.
8. Improve linker compatibility for g++ 3.4 `.gnu.linkonce.r.*.
9. Add VMS/ia64 support.
10. Improve arm support.
11. Improve cris support.
12. Improve m68k support.
13. Improve mips support.
14. Improve spu support.

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

1. binutils-2.19.51.0.8.tar.bz2. Source code.
2. binutils-2.19.51.0.7-2.19.51.0.8.diff.bz2. Patch against the
   previous beta source code.
3. binutils-2.19.51.0.8.i686.tar.bz2. IA-32 binary tar ball for RedHat
   EL 4.
4. binutils-2.19.51.0.8.ia64.tar.bz2. IA-64 binary tar ball for RedHat
   EL 4.
5. binutils-2.19.51.0.8.x86_64.tar.bz2. X64_64 binary tar ball for RedHat
   EL 4.

The primary sites for the beta Linux binutils are:

1. http://www.kernel.org/pub/linux/devel/binutils/

Thanks.


H.J. Lu
hjl.tools@gmail.com
06/03/2009
