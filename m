From: "Anant Aneja" <anantaneja@rediffmail.com>
Subject: Inerupts handling
Date: 2 Mar 2003 17:20:22 -0000
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20030302172022.26733.qmail@webmail31.rediffmail.com>
Reply-To: "Anant Aneja" <anantaneja@rediffmail.com>
Mime-Version: 1.0
Return-path: <gcc-help-return-11735-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc-help@gcc.gnu.org, linux-gcc@vger.kernel.org

My problem is i was using turbo c++ compiler before and 
frequently
used ROM-BIOS interupts for
certain functions ( like handling the screen, calling the mouse
etc all in dos based programs
using 386 based registers like ah al etc).

Now I've started using gcc and find that even a basic screen
clearing function requires me to use the
"ncurses" library. this i did but it handles the screen only 
using
windows and does not treat the console as an
unlimited buffer.

I dont wanna use the library therefore. plus it was a lot easier
calling interupts for most simple tasks.
I've read somewhere that Linux does not allow BIOS interupts 
since
it runs in 'protected' mode.
therefore, I cant do simple stuff like clearing a screen myself.

Is there some way to do the above task easily (with or without
assembly ?)

Please help.
Anant








