From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sat, 27 Dec 2003 02:24:59 -0800
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <87fzf6mubo.fsf@egil.codesourcery.com>
References: <20031225052045.A18774@zzz.ward.six>
	<20031225003819.GC13447@redhat.com>
	<20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>
	<20031225064518.F7419@zzz.ward.six>
	<87d6acjlfp.fsf@egil.codesourcery.com>
	<20031227045815.GA14291@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14179-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20031227045815.GA14291@redhat.com> (Richard Henderson's
 message of "Fri, 26 Dec 2003 20:58:15 -0800")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@redhat.com>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Richard Henderson <rth@redhat.com> writes:

> On Thu, Dec 25, 2003 at 07:40:42PM -0800, Zack Weinberg wrote:
>> For a starter, try changing "m" and see how far you get.
>
> That would definitely be wrong when the operand is actually used.

I suspected that might be the case.

Denis' original example doesn't quote actual code but I think it's
talking about stuff like this (from libc cvs,
sysdeps/i386/i486/bits/string.h) -

__STRING_INLINE void *
__memcpy_g (void *__dest, __const void *__src, size_t __n)
{
  register unsigned long int __d0, __d1, __d2;
  register void *__tmp = __dest;
  __asm__ __volatile__
    ("cld\n\t"
     "shrl      $1,%%ecx\n\t"
     "jnc       1f\n\t"
     "movsb\n"
     "1:\n\t"
     "shrl      $1,%%ecx\n\t"
     "jnc       2f\n\t"
     "movsw\n"
     "2:\n\t"
     "rep; movsl"
     : "=&c" (__d0), "=&D" (__d1), "=&S" (__d2),
       "=m" ( *(struct { __extension__ char __x[__n]; } *)__dest)
     : "0" (__n), "1" (__tmp), "2" (__src),
       "m" ( *(struct { __extension__ char __x[__n]; } *)__src)
     : "cc");
  return __dest;
}

so, first off, I don't think this kind of optimization is libc's
business; we have the tools to do a better job over here in the
compiler.  And furthermore I think it's buggy - if the block to be
copied is large and not aligned, it will overwrite memory past the end
of the destination.  

But let's suppose /arguendo/ that there is a legitimate use for a
construct like this: the notation is frankly appalling.  Let me try to
make up some better notation, using C99 variably-modified arrays and
GNU forward parameter declarations (we have the blasted things, we
might as well get some use out of them...)  Note I am not attempting
to fix the bugs in the assembly.

__STRING_INLINE void *
__memcpy_g (size_t __n; char __dest[restrict static __n], 
            const char __src[restrict static __n], size_t __n)
{
  void *savedest = __dest;
  __asm__ __volatile__
    ("cld\n\t"
     "shrl      $1,%%ecx\n\t"
     "jnc       1f\n\t"
     "movsb\n"
     "1:\n\t"
     "shrl      $1,%%ecx\n\t"
     "jnc       2f\n\t"
     "movsw\n"
     "2:\n\t"
     "rep; movsl"
     : "+c" (__n), "+@S" (__src), "+@D" (__dest));
  return savedest;
}

@ is a character not otherwise used in constraints; it means 'the
value here is a pointer and the memory pointed to will be accessed'.
Exactly how much memory, and the nature of the access, are determined
by the type of the pointer.  Here, both pointers are restrict-
qualified and point to memory blocks of known size (that's what
"static __n" in the brackets means).  Furthermore, __src points to
constant memory, so that block is only read, whereas __dest is not
constant so the compiler shall assume it's written.  I had to change
the types from void to char so the size expressions would be
meaningful; if you were actually to use this to implement memcpy,
you'd wrap it in another inline function that casted the arguments.

I think that's all that should be needed.  Thoughts?

zw
