From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sun, 28 Dec 2003 18:22:08 -0800
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <871xqol5wv.fsf@codesourcery.com>
References: <20031225052045.A18774@zzz.ward.six>
	<20031225003819.GC13447@redhat.com>
	<20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>
	<20031225064518.F7419@zzz.ward.six>
	<87d6acjlfp.fsf@egil.codesourcery.com>
	<20031227045815.GA14291@redhat.com>
	<87fzf6mubo.fsf@egil.codesourcery.com>
	<20031227163540.B6728@zzz.ward.six>
	<87brpum7gm.fsf@egil.codesourcery.com>
	<20031229015820.C6728@zzz.ward.six>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14204-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20031229015820.C6728@zzz.ward.six> (Denis Zaitsev's message of
 "Mon, 29 Dec 2003 01:58:20 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@redhat.com>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Denis Zaitsev <zzz@anda.ru> writes:

> On Sat, Dec 27, 2003 at 10:38:49AM -0800, Zack Weinberg wrote:
>> Denis Zaitsev <zzz@anda.ru> writes:
>> 
>> >> so, first off, I don't think this kind of optimization is libc's
>> >> business; we have the tools to do a better job over here in the
>> >> compiler.
>> >
>> > Should the compiler implement all the string functions?
>> 
>> That is the trend.  The compiler can make a better decision about
>> whether memcpy (for example) should be inlined at all, if it knows
>> the properties.
>
> Yes, but even if it can, it is rather a kinda political question -
> should it do so, or this must be defined by the programmer.  I
> personally like the latter approach, but who knows...

Meh.  I personally am convinced that the compiler can do a *much*
better job, and that trying to improve bits/string.h and
bits/string2.h is a waste of time; in fact, I've felt that they have
*always* caused the generated code to get worse, from the day they
were introduced.  I once tried to get Uli to take them out again, with
hard numbers to back me up, but he ignored me.

So I have very little interest in pursuing any of your suggestions.
If you want to keep at them, though, and come up with patches, feel
free.

zw
