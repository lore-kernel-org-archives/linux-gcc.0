From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Wed, 24 Dec 2003 17:21:16 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <87isk5lmk3.fsf@codesourcery.com>
References: <20031225052045.A18774@zzz.ward.six>
	<20031225003819.GC13447@redhat.com>
	<20031225061524.E7419@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-87920-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20031225061524.E7419@zzz.ward.six> (Denis Zaitsev's message of
 "Thu, 25 Dec 2003 06:15:24 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Denis Zaitsev <zzz@anda.ru> writes:

>> You could use the "X" constraint, which is supposed to mean "anything"
>> and by implication "unused", but it's normally only with scratch
>> registers, not memories, and the address reloads don't get deleted.
>  
> Yes, I've tried the "X" - there is no difference from the "m" - all
> the same unneded extra code (exactly).

I think the most constructive thing for you to do is find out _why_
all this unneeded extra code is being generated for "m" constraints
and then submit a patch to fix it.

zw
