From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Mon, 29 Dec 2003 01:58:20 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031229015820.C6728@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com> <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com> <20031227045815.GA14291@redhat.com> <87fzf6mubo.fsf@egil.codesourcery.com> <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14195-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <87brpum7gm.fsf@egil.codesourcery.com>; from zack@codesourcery.com on Sat, Dec 27, 2003 at 10:38:49AM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Sat, Dec 27, 2003 at 10:38:49AM -0800, Zack Weinberg wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> >> so, first off, I don't think this kind of optimization is libc's
> >> business; we have the tools to do a better job over here in the
> >> compiler.
> >
> > Should the compiler implement all the string functions?
> 
> That is the trend.  The compiler can make a better decision about
> whether memcpy (for example) should be inlined at all, if it knows
> the properties.

Yes, but even if it can, it is rather a kinda political question -
should it do so, or this must be defined by the programmer.  I
personally like the latter approach, but who knows...

> If it does decide to inline a general memcpy algorithm, it doesn't
> have to treat it as a giant opaque block of assembly language, not
> to be modified.

I agree definitely.  But the same is necessary for inline-asm as well.
There should be an ability to show to the compiler the properties of
the asm block, which would allow the compiler to work well with it.
For now, as I understand, there are two such possibilities - an
abcense of the "volatile" keyword and a (manual) splitting the asm
block into some "volatile" ones.  These don't seem to be bad, but the
compiler hasn't got some other abilities (ihmo) to work excellent with
these two.

> It can schedule other things simultaneously, if that's a good move;
> it can prove that some of the insns are unnecessary and eliminate
> them; etc. etc.

Ok, ok again.  But in the real life the external inline-asm seems not
to feel so bad from this point of view.  The real inline-asm defun
usually contains some prologue and epilogue written in the usual C.
And there are the places where the compiler may do its optimisation
job.  It's just like a work with an invariants moved outside the loop.

> > Very probably not.  But anyway, then these problem will be inside
> > the compiler (again).
> 
> No; we have more flexible ways of expressing this sort of thing
> inside the compiler.

But it seems to be politically wrong - not to keep the library
functions _in_ the library, doesn't it?  For some _very basic_
primitives it's ok, but not for the whole library functions, even
though for the basic ones.

> I just made it up.  It is not implemented at present, nor will it
> necessarily _be_ implemented.  I was making a suggestion for a better
> way to write this stuff.

Heh...  :)  And I was trying to play with them...

> > (The only remark is - it must be "+@&S" etc., there are the
> > earlyclobbered operands.)
> 
> There are now only three operands and they have non-overlapping
> register classes, so & is not necessary.

Ok, I'm sorry.  I don't use "S" etc., so I just overlooked the
things...

> Please remember that "m" (extension struct blah blah __dest) was
> written in the original for a reason.  You're not going to see it in
> simple test cases, but the compiler has to be told that the asm
> statement modifies memory, or it *will* mis-optimize around it. My
> example code, with no meaning implemented for "@", is like that.

I understand this.  And I'm not arguing with it.  I just have a
(grounded?) feeling, that this benefit is quite rare possible to be
met in the real life.  Other people have the same feeling - look at
http://gcc.gnu.org/ml/gcc-patches/2002-03/msg00521.html and the thread.

> The point of the original construct was to tell the compiler exactly
> what blocks of memory were modified.  This turns out to have
> undesirable side effects, which we're trying to get around here, but
> let's not forget what the original point was.  If there weren't
> cases where clobbering "memory" caused poor optimization, no one
> would have bothered with the "m" mess in the first place.

So about these "undesirable side effects" - they should be left in
piece till some good time, when GCC will start not to produce them.
Ok, it sounds nearly reasonable.  But please look thru that
sysdeps/i386/i486/bits/string.h - it has definitely been written with
some oter approaches in mind(s).  It's full of misc. workarounds off
GCC, and it looks like a kind of a way to reach the good machine code
while the world around it, including the compiler, is not ideal.  So,
I'm just wondering why one such a subway has been choosen vs. some
other, while this first one obviously has cons and its pros seems to
be just ephemeral...  If they are real, then the question in that its
form is vanishing.  But what I've found for now is a suspicions more
than the hard evidences... :)
