From: SoloCDM <deedsmis@aculink.net>
Subject: Mistake With CPP File
Date: Wed, 31 Jul 2002 05:04:04 -0600
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net>
Reply-To: deedsmis@aculink.net, linux-gcc@vger.kernel.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------AD53624A74880592F74AAF9B"
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
To: "Linux-Gcc (Majordomo)" <linux-gcc@vger.kernel.org>

This is a multi-part message in MIME format.
--------------AD53624A74880592F74AAF9B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Recently I tried to compile fig01_02.cpp with Kernel 2.2.20 on Linux
Mandrake 8.0.  I used "gcc fig01_02.cpp" and received the following
errors:

<user_account>/tmp/ccmeDWKS.o: In function `main':
<user_account>/tmp/ccmeDWKS.o(.text+0xf): undefined reference to
`cout'
<user_account>/tmp/ccmeDWKS.o(.text+0x14): undefined reference to
`ostream::operator<<(char const *)'collect2: ld returned 1 exit status

Why didn't it work?

I attached the file in question.

-- 
Note: When you reply to this message, please include the mailing
      list/newsgroup address and my email address in To:.

*********************************************************************
Signed,
SoloCDM
--------------AD53624A74880592F74AAF9B
Content-Type: text/plain; charset=us-ascii;
 name="fig01_02.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fig01_02.cpp"

// Fig. 1.2: fig01_02.cpp
// A first program in C++
#include <iostream.h>

int main()
{
	cout << "Welcome to C++!\n";

	return 0;   // indicate that program ended successfully
}

--------------AD53624A74880592F74AAF9B--
