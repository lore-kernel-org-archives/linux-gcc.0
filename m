From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 19:40:42 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <87d6acjlfp.fsf@egil.codesourcery.com>
References: <20031225052045.A18774@zzz.ward.six>
	<20031225003819.GC13447@redhat.com>
	<20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>
	<20031225064518.F7419@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-87929-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20031225064518.F7419@zzz.ward.six> (Denis Zaitsev's message of
 "Thu, 25 Dec 2003 06:45:18 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Denis Zaitsev <zzz@anda.ru> writes:

> So, does it mean that we are indeed speaking about the problem in
> GCC?

I think you've demonstrated that there isn't an ideal way to write
this construct right now.  ("memory" clobbers having their own
problems).

The next stage is to figure out (a) what the right notation is, and
(b) what needs to be done in GCC to make it work.  I cannot tell
whether the semantics of "m" should change, or whether new notation
should be introduced.  For a starter, try changing "m" and see how far
you get.

> So, whould you please to show me any points to speed up my start?
> For now, the only one part of GCC is not really new for me :)

Sorry, I do not know where this is happening.

zw
