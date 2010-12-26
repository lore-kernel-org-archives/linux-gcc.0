From: Jeff Chua <jeff.chua.linux@gmail.com>
Subject: Re: The Linux binutils 2.21.51.0.4 is released
Date: Sun, 26 Dec 2010 12:02:16 +0800
Message-ID: <AANLkTimtadjJAjJqVsPQTkfw2PGnFc3muUbkdyD_GbUY@mail.gmail.com>
References: <20101217045016.GA19218@lucon.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gcc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=h5XteKuSVRW5f95LVEEAVqEnges2qRxpEvVjelwYYg0=;
        b=iPnB5l5kWKGReKq1dMkjvXqC1lAAtVON5O8HhkbcRTW3a8Y71mP/8Y1C6KreW8viBF
         oQ0oI5wzV85CVqBuUB59YRLQcR9hfwZAO5Lj0gsyWwX9qSJ3BmoGYQoGqefnF6sys/mP
         r3lu7RxrwmeSBTXdD2UzwRLkfpIA0CR4tNV7o=
In-Reply-To: <20101217045016.GA19218@lucon.org>
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "H.J. Lu" <hjl.tools@gmail.com>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org, GNU C Library <libc-alpha@sourceware.org>, Mat Hostetter <mat@lcs.mit.edu>, Warner Losh <imp@village.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, linux-vax@pergamentum.com

On Fri, Dec 17, 2010 at 12:50 PM, H.J. Lu <hongjiu.lu@intel.com> wrote:
> This release fixes the Linux relocatable kernel build:
>
> http://sourceware.org/bugzilla/show_bug.cgi?id=3D12327
>
> The follow Linux binutils releases are affected: 2.20.51.0.12,
> 2.21.51.0.1, 2.21.51.0.2 and 2.21.51.0.3. =A0The FSF binutils 2.21
> is also affected.
> report any bugs related to binutils 2.21.51.0.4 to hjl.tools@gmail.co=
m

HJ,

I was using  binutils-2.21.51.0.4 without any problem until I went
back to recompile glibc and resulted in segmentation fault below:

make[2]: Entering directory `/v6/src2/glibc/glibc/sunrpc'
CPP=3D'gcc -E -x c-header'
/v6/src2/glibc/glibc/build/elf/ld-linux-x86-64.so.2 --library-path
/v6/src2/glibc/glibc/build:/v6/src2/glibc/glibc/build/math:/v6/src2/gli=
bc/glibc/build/elf:/v6/src2/glibc/glibc/build/dlfcn:/v6/src2/glibc/glib=
c/build/nss:/v6/src2/glibc/glibc/build/nis:/v6/src2/glibc/glibc/build/r=
t:/v6/src2/glibc/glibc/build/resolv:/v6/src2/glibc/glibc/build/crypt:/v=
6/src2/glibc/glibc/build/nptl
/v6/src2/glibc/glibc/build/sunrpc/rpcgen -Y ../scripts -c
rpcsvc/bootparam_prot.x -o
/v6/src2/glibc/glibc/build/sunrpc/xbootparam_prot.T
make[2]: *** [/v6/src2/glibc/glibc/build/sunrpc/xbootparam_prot.stmp]
Segmentation fault


# glibc
GNU C Library development release version 2.12.90, by Roland McGrath et=
 al.
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
Compiled by GNU CC version 4.4.5.
Compiled on a Linux 2.6.37 system on 2010-12-26.
Available extensions:
        crypt add-on version 2.1 by Michael Glad and others
        Native POSIX Threads Library by Ulrich Drepper et al
        BIND-8.2.3-T5B
libc ABIs: UNIQUE IFUNC

# gcc -v
 gcc -v
Using built-in specs.
Target: x86_64-unknown-linux-gnu
Configured with: ../configure --prefix=3D/usr --enable-shared
--disable-static --with-local-prefix=3D/usr
--with-gxx-include-dir=3D/usr/include/g++ --with-system-zlib
Thread model: posix
gcc version 4.4.5 (GCC)

# uname  -a
Linux boston 2.6.37-rc7 #29 SMP PREEMPT Fri Dec 24 16:26:12 SGT 2010
x86_64 GNU/Linux

I've tried binutils-2.21.51.0.2 as well, but was still problem. Only
versions up to binutils-2.21.51.0.1 works ... glibc compiles
successful. I've also tested glibc-2.11.3 as well with the same
results.

Could this be a binutils problem or something missing in my glibc compi=
lation?

Thanks,
Jeff
