From: "Nate" <nate@uniwest.com>
Subject: Re: C Language Reference for @ and :
Date: Wed, 28 Aug 2002 14:09:37 -0700
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <000c01c24ed7$37acc580$5001a8c0@uniwest.com>
References: <Pine.GSO.4.21.0208281355510.20978-100000@general3.asu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "<Iliyan Malchev>" <ibm@asu.edu>
Cc: linux-gcc@vger.kernel.org

I thought that could be the answer on the bit width issue...

I do not know which compiler was being used but I bet you're right because
this code was to compile for a micro-controller.  So the output was probably
hex code to download onto the chip.  They were probably addresses.

Thank You,

Nate



----- Original Message -----
From: "<Iliyan Malchev>" <ibm@asu.edu>
To: "Nate" <nate@uniwest.com>
Sent: Wednesday, August 28, 2002 2:00 PM
Subject: Re: C Language Reference for @ and :


>
> >
> > I am looking at some C code and I cannot find any language reference as
to
> > what the '@' symbol or token means...
> >
> > For, example, from the header file I am trying to interpret....
> >
> > /////////////////////////////////////////////////////////////////
> > static unsigned char P1 @ 0x90;
> > static unsigned char P2 @ 0xA0;
> > static unsigned char P3 @ 0xB0;
> > /////////////////////////////////////////////////////////////////
> >
>
> The '@' symbol is not standard notation: perhaps the compiler
> you are using has a language extension of some sort.
>
> > /////////////////////////////////////////////////////////////////
> > typedef struct
> > {
> >    unsigned B0:1;
> >    unsigned B1:1;
> >    unsigned B2:1;
> >    unsigned B3:1;
> >    unsigned B4:1;
> >    unsigned B5:1;
> >    unsigned B6:1;
> >    unsigned B7:1;
> > } SFR;
> > /////////////////////////////////////////////////////////////////
>
> The colon defines the width of the respective field in a number of bits
(that
> is, it defined a bit field).  In the example above, you have a structure
where
> each member is one-bit-wide, and the total structure is 8 bits (one
> byte).  Thus if you had the following code:
>
> static SFR val; /* set the structure to all zeroes */
>
> ....
>
> val.B5 = 1; /* set the 5th bit */
> fprintf (stdout, "val: %x\n", (unsigned char)val);
>
> will print out the value
>
> val: 20
>
> (binary 0010 0000, the fifth bit was set).
>
>
>

