From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sun, 28 Dec 2003 18:46:33 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <87smj4jq7q.fsf@codesourcery.com>
References: <20031225061524.E7419@zzz.ward.six>
	<87isk5lmk3.fsf@codesourcery.com> <20031225064518.F7419@zzz.ward.six>
	<87d6acjlfp.fsf@egil.codesourcery.com>
	<20031227045815.GA14291@redhat.com>
	<87fzf6mubo.fsf@egil.codesourcery.com>
	<20031227163540.B6728@zzz.ward.six>
	<87brpum7gm.fsf@egil.codesourcery.com>
	<20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com>
	<20031229074447.D6728@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-87959-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20031229074447.D6728@zzz.ward.six> (Denis Zaitsev's message of
 "Mon, 29 Dec 2003 07:44:47 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@redhat.com>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Denis Zaitsev <zzz@anda.ru> writes:

> On Sun, Dec 28, 2003 at 06:22:08PM -0800, Zack Weinberg wrote:
>> 
>> Meh.  I personally am convinced that the compiler can do a *much*
>> better job, and that trying to improve bits/string.h and
>> bits/string2.h is a waste of time; in fact, I've felt that they have
>> *always* caused the generated code to get worse, from the day they
>> were introduced.  I once tried to get Uli to take them out again,
>> with hard numbers to back me up, but he ignored me.
>
> Who is Uli - Ulrich Drepper?

Yes.

>> So I have very little interest in pursuing any of your suggestions.
>
> But I don't even try to have you to do so!  I'm just trying to
> understand what is/was happening.  I very don't like the content of
> bits/string[2].h too.  And I don't want to offend you.  I'm very
> sorry, if so.

No offense was taken, and I'm sorry I was so short.

I meant to indicate that I lack the time even to consider the rest of
your message at any length, so I cannot answer the questions you
raise.  Again I apologize.

zw
