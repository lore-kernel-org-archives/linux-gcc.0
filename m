From: Denis Zaitsev <zzz@anda.ru>
Subject: GCC 3.3.2 -Wall affects the code generated...
Date: Fri, 2 Jul 2004 00:03:03 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040702000303.A797@natasha.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <gcc-return-98742-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gcc@gcc.gnu.org
Cc: linux-gcc@vger.kernel.org

The long story is such: I was compiling GLIBC 2.3.2 and there is a
file libio/fileops.c which includes iconv/gconv_charset.h.  In this
header an inline function named strip is defined.  And I found that
the object code generated for this function depends of the presence of
-Wall in the list of option to GCC.  (For some reason, GCC can't
inline this function, so it's compiled as just an outline one.)  Is
this a bug in GCC?

Below I include the source code of this strip function and its
assembler generated with and without -Wall.  I can say also, that it
seems that this libio/fileops.c file is kinda 'hard to compile'
source: another tho inline functions can't be inlined (and GCC
complains about that), GCC warns that yet another one function
'declared inline after being called', even though it's not true
(AFAIK) and GCC just silently refuse to do some other optimization
during the compilation.


The source code:


static inline void
strip (char *wp, const char *s)
{
  int slash_count =3D 0;

  while (*s !=3D '\0')
    {
      if (__isalnum_l (*s, &_nl_C_locobj)
	  || *s =3D=3D '_' || *s =3D=3D '-' || *s =3D=3D '.')
	*wp++ =3D __toupper_l (*s, &_nl_C_locobj);
      else if (*s =3D=3D '/')
	{
	  if (++slash_count =3D=3D 3)
	    break;
	  *wp++ =3D '/';
	}
      ++s;
    }

  while (slash_count++ < 2)
    *wp++ =3D '/';

  *wp =3D '\0';
}


The command line:


gcc fileops.c -c -std=3Dgnu99 -D__USE_STRING_INLINES -O2 -Wall -Winline -Ws=
trict-prototypes -Wwrite-strings -fno-align-functions -fno-align-jumps -fno=
-align-loops -fno-ident -fno-strength-reduce -mcpu=3Dpentium -mpreferred-st=
ack-boundary=3D2 -pipe   -fPIC -g0 -fomit-frame-pointer -fexceptions   -I..=
/include -I. -I/home/src/zzz/lib/glibc/bld/libio -I.. -I../libio  -I/home/s=
rc/zzz/lib/glibc/bld -I../sysdeps/i386/elf -I../linuxthreads/sysdeps/unix/s=
ysv/linux/i386 -I../linuxthreads/sysdeps/unix/sysv/linux -I../linuxthreads/=
sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv -I=
../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/i386/i586 -I../linux=
threads/sysdeps/i386 -I../sysdeps/unix/sysv/linux/i386 -I../sysdeps/unix/sy=
sv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -=
I../sysdeps/unix/inet -I../sysdeps/unix/sysv/i386 -I../sysdeps/unix/sysv -I=
../sysdeps/unix/i386 -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/i386=
/i586 -I../sysdeps/i386/i486 -I../sysdeps/i386/fpu -I../sysdeps/i386 -I../s=
ysdeps/wordsize-32 -I../sysdeps/ieee754/ldbl-96 -I../sysdeps/ieee754/dbl-64=
 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic/elf =
-I../sysdeps/generic  -I /lib/modules/2.4.24/build/include -D_LIBC_REENTRAN=
T -include ../include/libc-symbols.h  -DPIC -DSHARED     -D_IO_MTSAFE_IO -o=
 ...


The assembler (-Wall):


strip:
=2ELFB113:
	pushl	%ebp
=2ELCFI521:
	xorl	%ebp, %ebp
	pushl	%edi
=2ELCFI522:
	pushl	%esi
=2ELCFI523:
	pushl	%ebx
=2ELCFI524:
	pushl	%edi
=2ELCFI525:
	call	.L796
=2EL796:
	popl	%ebx
	addl	$_GLOBAL_OFFSET_TABLE_+[.-.L796], %ebx
	movl	28(%esp), %edi
	movl	24(%esp), %esi
	movb	(%edi), %al
	movb	%al, 3(%esp)
	testb	%al, %al
	je	.L24
=2EL23:
	movsbl	3(%esp),%edx
	movl	52+_nl_C_locobj@GOTOFF(%ebx), %eax
	testb	$8, (%eax,%edx,2)
	jne	.L13
	cmpb	$95, 3(%esp)
	je	.L13
	cmpb	$45, 3(%esp)
	je	.L13
	cmpb	$46, 3(%esp)
	je	.L13
	cmpb	$47, 3(%esp)
	je	.L794
=2EL20:
	incl	%edi
	movb	(%edi), %al
	movb	%al, 3(%esp)
	testb	%al, %al
	jne	.L23
=2EL24:
	movl	%ebp, %eax
	incl	%ebp
	decl	%eax
	jg	.L795
	movb	$47, (%esi)
	incl	%esi
	jmp	.L24
=2ELCFI526:
=2EL795:
	movb	$0, (%esi)
	popl	%esi
=2ELCFI527:
	popl	%ebx
=2ELCFI528:
	popl	%esi
=2ELCFI529:
	popl	%edi
=2ELCFI530:
	popl	%ebp
=2ELCFI531:
	ret
=2EL794:
	incl	%ebp
	cmpl	$3, %ebp
	je	.L24
	movb	$47, (%esi)
	incl	%esi
	jmp	.L20
=2EL13:
	movsbl	3(%esp),%edx
	movl	60+_nl_C_locobj@GOTOFF(%ebx), %eax
	movl	%esi, %ecx
	incl	%esi
	movl	(%eax,%edx,4), %eax
	movb	%al, (%ecx)
	jmp	.L20
=2ELFE113:
	.size	strip, .-strip
	.type	upstr, @function


The assembler (w/o -Wall):


strip:
=2ELFB113:
	pushl	%ebp
=2ELCFI521:
	xorl	%ebp, %ebp
	pushl	%edi
=2ELCFI522:
	pushl	%esi
=2ELCFI523:
	pushl	%ebx
=2ELCFI524:
	pushl	%edi
=2ELCFI525:
	call	.L797
=2EL797:
	popl	%ebx
	addl	$_GLOBAL_OFFSET_TABLE_+[.-.L797], %ebx
	movl	28(%esp), %edi
	movl	24(%esp), %esi
	movb	(%edi), %al
	movb	%al, 3(%esp)
	testb	%al, %al
	je	.L10
=2EL23:
	movsbl	3(%esp),%edx
	movl	52+_nl_C_locobj@GOTOFF(%ebx), %eax
	testb	$8, (%eax,%edx,2)
	jne	.L13
	cmpb	$95, 3(%esp)
	je	.L13
	cmpb	$45, 3(%esp)
	je	.L13
	cmpb	$46, 3(%esp)
	je	.L13
	cmpb	$47, 3(%esp)
	je	.L796
=2EL20:
	incl	%edi
	movb	(%edi), %al
	movb	%al, 3(%esp)
	testb	%al, %al
	jne	.L23
=2EL10:
	movl	%ebp, %eax
	incl	%ebp
	decl	%eax
	jle	.L27
=2EL795:
	movb	$0, (%esi)
	popl	%esi
=2ELCFI526:
	popl	%ebx
=2ELCFI527:
	popl	%esi
=2ELCFI528:
	popl	%edi
=2ELCFI529:
	popl	%ebp
=2ELCFI530:
	ret
=2EL27:
	movl	%ebp, %eax
	movb	$47, (%esi)
	incl	%ebp
	incl	%esi
	decl	%eax
	jle	.L27
	jmp	.L795
=2EL796:
	incl	%ebp
	cmpl	$3, %ebp
	je	.L10
	movb	$47, (%esi)
	incl	%esi
	jmp	.L20
=2EL13:
	movsbl	3(%esp),%edx
	movl	60+_nl_C_locobj@GOTOFF(%ebx), %eax
	movl	%esi, %ecx
	incl	%esi
	movl	(%eax,%edx,4), %eax
	movb	%al, (%ecx)
	jmp	.L20
=2ELFE113:
	.size	strip, .-strip
	.type	upstr, @function


The diff (I omited all the parts that describe only the different
labels):


47,51c47
< 	jg	.L795
< 	movb	$47, (%esi)
< 	incl	%esi
< 	jmp	.L24
< .LCFI526:
---
> 	jle	.L27

65c61,69
< .L794:
---
> .L27:
> 	movl	%ebp, %eax
> 	movb	$47, (%esi)
> 	incl	%ebp
> 	incl	%esi
> 	decl	%eax
> 	jle	.L27
> 	jmp	.L795
> .L796:
