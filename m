From: "Nate" <nate@uniwest.com>
Subject: C Language Reference for @ and :
Date: Wed, 28 Aug 2002 13:50:26 -0700
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <000301c24ed4$8a6fa100$5001a8c0@uniwest.com>
References: <1028188562.1091.4.camel@skt.int.local> <3D49201B.1090102@escriba.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org


I am looking at some C code and I cannot find any language reference as to
what the '@' symbol or token means...

For, example, from the header file I am trying to interpret....

/////////////////////////////////////////////////////////////////
static unsigned char P1 @ 0x90;
static unsigned char P2 @ 0xA0;
static unsigned char P3 @ 0xB0;
/////////////////////////////////////////////////////////////////



Also what does these colons mean... ( I understand this is creating a new
type and it is a "public by default" class for a bit watching type.)  But
what does the colon do?  Initialize defualts?

/////////////////////////////////////////////////////////////////
typedef struct
{
   unsigned B0:1;
   unsigned B1:1;
   unsigned B2:1;
   unsigned B3:1;
   unsigned B4:1;
   unsigned B5:1;
   unsigned B6:1;
   unsigned B7:1;
} SFR;
/////////////////////////////////////////////////////////////////


Thanks,

Nate

