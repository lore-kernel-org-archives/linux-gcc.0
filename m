From: Andre Majorel <amajorel@teaser.fr>
Subject: "fixed or forbidden register 0 (ax) was spilled for class AREG"
Date: Sat, 21 Dec 2002 00:14:32 +0100
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20021220231432.GA1013@teaser.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-gcc@vger.kernel.org

Greetings gentlemen. Trying to compile Linux-hexen 0.6.0 with
GCC 2.95.4, I got "Invalid `asm' statement" errors. The errors
occur in a routine that seems to multiply a 16.16 fixed point
number by a integer. Here's a fragment that triggers the error :

   1  typedef int fixed_t;
   2 =20
   3  int foo (void)
   4  {
   5    int f_w;
   6    fixed_t m_w;
   7    fixed_t scale_ftom;
   8 =20
   9    m_w =3D
  10    (
  11      {
  12        int __value, __fb =3D (scale_ftom);
  13        __asm__("imul %%ebx; shrd $16,%%edx,%%eax"
  14                : "=3Da" (__value)
  15                : "a" (f_w<<16), "b" (__fb)
  16                : "eax", "edx");
  17        __value;
  18      }
  19    );
  20  }

  $ gcc badasm.c
  badasm.c: In function `foo':
  badasm.c:16: Invalid `asm' statement:
  badasm.c:16: fixed or forbidden register 0 (ax) was spilled for class=
 AREG.

This code used to compile before GCC was upgraded. I'd
appreciate any hints on how to fix it.

--=20
Andr=E9 Majorel <amajorel@teaser.fr>
http://www.teaser.fr/~amajorel/
