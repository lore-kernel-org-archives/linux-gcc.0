From: Jeff.Fellin@rflelect.com
Subject: Shared Library memory usage question
Date: Fri, 24 Jun 2005 14:33:03 -0400
Message-ID: <OFB3A8DFA1.660DB196-ON8525702A.005F931A@teal.com>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org

Sorry if this is the incorrect mailing list for this question. If this
isn't the correct list, please suggest the correct/better list.

I am trying to use shared libraries in a PPC 405GP Embedded Linux platform.
I have followed
the various instructions for creating shared libraries and linking with the
created shared libraries.

The libraries are created by the following skeleton
      g++ -fpic -c f.o [ f.cpp | f.c ]
      g++ -shared -o lib.so *.o

The applications are created by this skeleton

      g++ -c a.o a.cpp
      g++ -Bdynamic -o a lib.so *.o

When I compare the sizes of the executables I see the expected size
reductions by eliminating
the static libraries. The sizes of the shared libraries are comparable to
the static version.


The problem I'm seeing is the amount of memory (SDRAM) in my system has not
decreased with
the shared libraries, but has actually decreased.

.HOW can I use shared libraries and decrease the memory space being used by
the system?
All suggestions/explanations welcome

The data for one shared library is below.


Examining the of  /proc/<pid>/status, I have observed three lines for every
shared library

The /proc/<pid>/status output for one library is:
      0ff4c000-0ff50000   r-xp 00000000 1f:04 196    /lib/libNvramAccess.so
      0ff50000-0ff5c000   ---p 00004000 1f:04 196
/lib/libNvramAccess.so
      0ff5c000-0ff61000 rwxp 00000000 1f:04 196    /lib/libNvramAccess.so

If  I'm intepreting the output of status it indicates one section of the
library is loaded twice
with different sizes. The first line shows 0x4000 bytes, and the third
shows 0x5000 bytes
Also the size of the second line shows the data/bss space is c000 bytes,
which is larger
than the entire shared library text and data!


The output of size /lib/NvramAccess.so
   text        data         bss         dec         hex     filename
  15411        2280         353       18044        467c
libNvramAccess.so

The output of dump/objdump for the shared library table shows:


libNvramAccess.so:     file format elf32-powerpc
libNvramAccess.so
architecture: powerpc:common, flags 0x00000150:
HAS_SYMS, DYNAMIC, D_PAGED
start address 0x00001920

Program Header:
    LOAD off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**16
         filesz 0x00003b00 memsz 0x00003b00 flags r-x
    LOAD off    0x00003b00 vaddr 0x00013b00 paddr 0x00013b00 align 2**16
         filesz 0x00000960 memsz 0x00000c14 flags rwx
 DYNAMIC off    0x00004334 vaddr 0x00014334 paddr 0x00014334 align 2**2
         filesz 0x00000098 memsz 0x00000098 flags rw-

Dynamic Section:
  SYMBOLIC    0x0
  HASH        0x94
  STRTAB      0xab8
  SYMTAB      0x3d8
  STRSZ       0xc03
  SYMENT      0x10
  PLTGOT      0x14464
  PLTRELSZ    0x108
  PLTREL      0x7
  JMPREL      0x1818
  RELA        0x16bc
  RELASZ      0x264
  RELAENT     0xc
  RELACOUNT   0x1c

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .hash         00000344  00000094  00000094  00000094  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .dynsym       000006e0  000003d8  000003d8  000003d8  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  2 .dynstr       00000c03  00000ab8  00000ab8  00000ab8  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .rela.dyn     0000015c  000016bc  000016bc  000016bc  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 .rela.plt     00000108  00001818  00001818  00001818  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 .text         00001ed8  00001920  00001920  00001920  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  6 .rodata       00000308  000037f8  000037f8  000037f8  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  7 .data         000000d0  00013b00  00013b00  00003b00  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  8 .eh_frame     00000764  00013bd0  00013bd0  00003bd0  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  9 .dynamic      00000098  00014334  00014334  00004334  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 10 .ctors        00000004  000143cc  000143cc  000043cc  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 11 .dtors        00000004  000143d0  000143d0  000043d0  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 12 .got          00000078  000143d4  000143d4  000043d4  2**2
                  CONTENTS, ALLOC, LOAD, CODE
 13 .sdata2       00000000  0001444c  0001444c  0000444c  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 14 .sdata        00000014  0001444c  0001444c  0000444c  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 15 .sbss         00000001  00014460  00014460  00004460  2**0
                  ALLOC
 16 .plt          00000150  00014464  00014464  00004463  2**2
                  ALLOC, CODE
 17 .bss          00000160  000145b4  000145b4  00004463  2**2
                  ALLOC
 18 .comment      00000010  00000000  00000000  00004463  2**0
                  CONTENTS, READONLY





Jeff Fellin
RFL Electronics
Jeff.Fellin@rflelect.com
973 334-3100, x 327

