From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sat, 27 Dec 2003 10:38:49 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <87brpum7gm.fsf@egil.codesourcery.com>
References: <20031225052045.A18774@zzz.ward.six>
	<20031225003819.GC13447@redhat.com>
	<20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>
	<20031225064518.F7419@zzz.ward.six>
	<87d6acjlfp.fsf@egil.codesourcery.com>
	<20031227045815.GA14291@redhat.com>
	<87fzf6mubo.fsf@egil.codesourcery.com>
	<20031227163540.B6728@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-87940-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20031227163540.B6728@zzz.ward.six> (Denis Zaitsev's message of
 "Sat, 27 Dec 2003 16:35:40 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@redhat.com>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Denis Zaitsev <zzz@anda.ru> writes:

>> so, first off, I don't think this kind of optimization is libc's
>> business; we have the tools to do a better job over here in the
>> compiler.
>
> Should the compiler implement all the string functions?

That is the trend.  The compiler can make a better decision about
whether memcpy (for example) should be inlined at all, if it knows the
properties.  If it does decide to inline a general memcpy algorithm,
it doesn't have to treat it as a giant opaque block of assembly
language, not to be modified.  It can schedule other things
simultaneously, if that's a good move; it can prove that some of the
insns are unnecessary and eliminate them; etc. etc.

> Very probably not.  But anyway, then these problem will be inside
> the compiler (again).

No; we have more flexible ways of expressing this sort of thing inside
the compiler.

>> And furthermore I think it's buggy - if the block to be copied is
>> large and not aligned, it will overwrite memory past the end of the
>> destination.
>
> Why do you think so?  The code looks ok.  I don't think it's the
> fastest one, but it's correct.

I misunderstood the consequences of doing rep movsl with unaligned
pointers.  It just does lots of slow misaligned memory accesses; it
doesn't overwrite memory outside the destination block.

>> @ is a character not otherwise used in constraints; it means 'the
>> value here is a pointer and the memory pointed to will be accessed'.
>
> Why isn't it documented?  Is it a kind of "new" one?

I just made it up.  It is not implemented at present, nor will it
necessarily _be_ implemented.  I was making a suggestion for a better
way to write this stuff.

> (The only remark is - it must be "+@&S" etc., there are the
> earlyclobbered operands.)

There are now only three operands and they have non-overlapping
register classes, so & is not necessary.

> Does this "@" behaves as well with unrestricted pointers like just
> (char *s)?

The less information the compiler has about the pointer, the more
memory it would have to assume is modified.  At worst, "@" should
be equivalent to clobbering "memory".

> I've just tried this (on mine examples, with unrestricted pointers).
> The things seem to be fine.  Not ideal (reloading suffers sometimes,
> but this is not the @-specific problem), but completely free of the
> problems introduced by "m".

Please remember that "m" (extension struct blah blah __dest) was
written in the original for a reason.  You're not going to see it in
simple test cases, but the compiler has to be told that the asm
statement modifies memory, or it *will* mis-optimize around it. My
example code, with no meaning implemented for "@", is like that.

The point of the original construct was to tell the compiler exactly
what blocks of memory were modified.  This turns out to have
undesirable side effects, which we're trying to get around here, but
let's not forget what the original point was.  If there weren't cases
where clobbering "memory" caused poor optimization, no one would have
bothered with the "m" mess in the first place.

zw
