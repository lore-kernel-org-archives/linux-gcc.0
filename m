From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: C Language Reference for @ and :
Date: Wed, 28 Aug 2002 15:16:40 -0700
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <5.1.0.14.0.20020828145900.01d25780@fluent2.pyramid.net>
References: <1028188562.1091.4.camel@skt.int.local>
 <3D49201B.1090102@escriba.com.br>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <000301c24ed4$8a6fa100$5001a8c0@uniwest.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Nate <nate@uniwest.com>, linux-gcc@vger.kernel.org

At 01:50 PM 8/28/02 -0700, Nate wrote:
>I am looking at some C code and I cannot find any language reference as to
>what the '@' symbol or token means...
>
>For, example, from the header file I am trying to interpret....
>
>/////////////////////////////////////////////////////////////////
>static unsigned char P1 @ 0x90;
>static unsigned char P2 @ 0xA0;
>static unsigned char P3 @ 0xB0;
>/////////////////////////////////////////////////////////////////

The compiler implements an extension that indicates that the unsigned char 
P1 is at the absolute address 0x00000090, and when the compiler generates 
an access it should use this absolute address.  The equivalent ANSI C code 
using pointer variables might be:

static unsigned char * const P1 = (unsigned char *) 0x90;
static unsigned char * const P2 = (unsigned char *) 0xA0;
static unsigned char * const P3 = (unsigned char *) 0xB0;

Or the other way to do this is to use the preprocessor:

#define P1 ((unsigned char *)(0x90));
#define P2 ((unsigned char *)(0xA0));
#define P3 ((unsigned char *)(0xB0));

I used to see this with some compilers for machines that had memory-mapped 
I/O in which the registers were at hardware-fixed locations.  This is 
actually bad form, particularly when a driver can be used with multiple 
devices and there was no way to "map in" the particular device interface.

This is an oldie, and VERY machine-dependent.

>Also what does these colons mean... ( I understand this is creating a new
>type and it is a "public by default" class for a bit watching type.)  But
>what does the colon do?  Initialize defualts?
>
>/////////////////////////////////////////////////////////////////
>typedef struct
>{
>    unsigned B0:1;
>    unsigned B1:1;
>    unsigned B2:1;
>    unsigned B3:1;
>    unsigned B4:1;
>    unsigned B5:1;
>    unsigned B6:1;
>    unsigned B7:1;
>} SFR;
>/////////////////////////////////////////////////////////////////

Bitfield definition.  Page 136-138 in the first edition of K&R _The C 
Programming Language_, 149-150 in the second edition.  This is part of ANSI 
C, but the implementation definition makes it a non-portable 
construct.  Some people like to try to use bitfields in networking, with 
disastrous results as you change compilers or even versions of the same 
compiler.

The colon introduces a bit-width.  In your definition, you are defining 
seven bits in the variable SFR to be one-bit values that can be set or 
reset using a simple assignment statement:

      SFR.B0 = 1;   /* Set a single bit */
      SFR.B4 = 0;   /* Reset a single bit */

The problem is that which structure variables get assigned to which bits is 
not specified in the standard, but is labelled "implementation 
defined."  From the definition you show, I suspect that the compiler 
originally used to compile the code assigned bit fields from the low-order 
bits to the high-order bits of a regular integer.  Other compilers may 
start from the most significant bit and work down, which is why this 
construct is highly non-portable if you store or read the variable to/from 
storage or a network.

Satch

