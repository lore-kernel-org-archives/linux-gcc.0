From: SoloCDM <deedsmis@aculink.net>
Subject: Syntax Code Compiled Incorrectly
Date: Wed, 11 Sep 2002 13:39:47 -0600
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3D7F9C03.9E261B40@cdm01.deedsmiscentral.net>
Reply-To: deedsmis@aculink.net, linux-gcc@vger.kernel.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------422736D6292C7257F55E5E7E"
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
To: "Linux-GCC (Majordomo)" <linux-gcc@vger.kernel.org>

This is a multi-part message in MIME format.
--------------422736D6292C7257F55E5E7E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Recently I tried to compile sstrcom.cpp with Kernel 2.2.20 on Linux
Mandrake 8.0.  I used "g++ sstrcom.cpp" and received the following
errors:

sstrcom.cpp: In function `int main ()':
sstrcom.cpp:24: no matching function for call to `basic_string<char, 
string_char_traits<char>, __default_alloc_template<true, 0> >::compare 
(int, int, string &, int, int)'
/usr/include/g++-3/std/bastring.cc:398: candidates are: int 
basic_string<charT, traits, Allocator>::compare (const 
basic_string<charT, traits, Allocator> &, unsigned int = 0, unsigned 
int = basic_string<charT, traits, Allocator>::npos) const [with charT
= 
char, traits = string_char_traits<char>, Allocator = 
__default_alloc_template<true, 0>]
/usr/include/g++-3/std/bastring.cc:417:                 int 
basic_string<charT, traits, Allocator>::compare (const charT *, 
unsigned int, unsigned int) const [with charT = char, traits = 
string_char_traits<char>, Allocator = __default_alloc_template<true, 
0>]
/usr/include/g++-3/std/bastring.h:402:                 int 
basic_string<charT, traits, Allocator>::compare (const charT *, 
unsigned int = 0) const [with charT = char, traits = 
string_char_traits<char>, Allocator = __default_alloc_template<true, 
0>]

Everything points to "n = susername.compare( 0, 2, saname, 0, 2 );",
even though the immediate line preceding it doesn't have any errors.

What is wrong with the attached file?

The output indicates that a function doesn't exist in <string>; if so,
what library needs to be included?

--
Note: When you reply to this message, please include the mailing
      list and/or newsgroup address and my email address in To:

*********************************************************************
Signed,
SoloCDM
--------------422736D6292C7257F55E5E7E
Content-Type: text/plain; charset=us-ascii;
 name="sstrcom.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sstrcom.cpp"

// sstrcom.cpp
// Comparing string objects
#include <iostream>
#include <string>

using namespace std;

/*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*/
int main() {

	string saname = "George", susername;

	std::cout << "Enter your first name: ";
	cin >> susername;

	if ( susername == saname )
		std::cout << "Greetings, George\n";
	else if ( susername < saname )
		std::cout << "You come before George\n";
	else
		std::cout << "You come after George\n";

	int n = susername.compare( saname );
	n = susername.compare( 0, 2, saname, 0, 2 );

	std::cout << "The first two letters of your name ";

	if ( n == 0 )
		std::cout << "match ";
	else if ( n < 0 )
		std::cout << "come before ";
	else
		std::cout << "come after ";

	std::cout << saname.substr( 0, 2 ) << endl;

	return 0;

}


--------------422736D6292C7257F55E5E7E--
