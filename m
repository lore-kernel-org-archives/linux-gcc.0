From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sat, 27 Dec 2003 16:35:40 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031227163540.B6728@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com> <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com> <20031227045815.GA14291@redhat.com> <87fzf6mubo.fsf@egil.codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14182-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <87fzf6mubo.fsf@egil.codesourcery.com>; from zack@codesourcery.com on Sat, Dec 27, 2003 at 02:24:59AM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Sat, Dec 27, 2003 at 02:24:59AM -0800, Zack Weinberg wrote:

> Denis' original example doesn't quote actual code but I think it's
> talking about stuff like this (from libc cvs,
> sysdeps/i386/i486/bits/string.h) -

Exactly.  But I've mentioned that...

> __STRING_INLINE void *
> __memcpy_g (void *__dest, __const void *__src, size_t __n)
> {
>   register unsigned long int __d0, __d1, __d2;
>   register void *__tmp = __dest;
>   __asm__ __volatile__
>     ("cld\n\t"
>      "shrl      $1,%%ecx\n\t"
>      "jnc       1f\n\t"
>      "movsb\n"
>      "1:\n\t"
>      "shrl      $1,%%ecx\n\t"
>      "jnc       2f\n\t"
>      "movsw\n"
>      "2:\n\t"
>      "rep; movsl"
>      : "=&c" (__d0), "=&D" (__d1), "=&S" (__d2),
>        "=m" ( *(struct { __extension__ char __x[__n]; } *)__dest)
>      : "0" (__n), "1" (__tmp), "2" (__src),
>        "m" ( *(struct { __extension__ char __x[__n]; } *)__src)
>      : "cc");
>   return __dest;
> }
> 
> so, first off, I don't think this kind of optimization is libc's
> business; we have the tools to do a better job over here in the
> compiler.

Should the compiler implement all the string functions?  Very probably
not.  But anyway, then these problem will be inside the compiler
(again).  And anyway, there should be the right way to make such
inline solutions, if so...

> And furthermore I think it's buggy - if the block to be copied is
> large and not aligned, it will overwrite memory past the end of the
> destination.

Why do you think so?  The code looks ok.  I don't think it's the
fastest one, but it's correct.

> But let's suppose /arguendo/ that there is a legitimate use for a
> construct like this: the notation is frankly appalling.  Let me try
> to make up some better notation, using C99 variably-modified arrays
> and GNU forward parameter declarations (we have the blasted things,
> we might as well get some use out of them...)  Note I am not
> attempting to fix the bugs in the assembly.
> 
> __STRING_INLINE void *
> __memcpy_g (size_t __n; char __dest[restrict static __n], 
>             const char __src[restrict static __n], size_t __n)
> {
>   void *savedest = __dest;
>   __asm__ __volatile__
>     ("cld\n\t"
>      "shrl      $1,%%ecx\n\t"
>      "jnc       1f\n\t"
>      "movsb\n"
>      "1:\n\t"
>      "shrl      $1,%%ecx\n\t"
>      "jnc       2f\n\t"
>      "movsw\n"
>      "2:\n\t"
>      "rep; movsl"
>      : "+c" (__n), "+@S" (__src), "+@D" (__dest));
>   return savedest;
> }
> 
> @ is a character not otherwise used in constraints; it means 'the
> value here is a pointer and the memory pointed to will be accessed'.

Why isn't it documented?  Is it a kind of "new" one?

(The only remark is - it must be "+@&S" etc., there are the
earlyclobbered operands.)

> Exactly how much memory, and the nature of the access, are
> determined by the type of the pointer.  Here, both pointers are
> restrict- qualified and point to memory blocks of known size (that's
> what "static __n" in the brackets means).  Furthermore, __src points
> to constant memory, so that block is only read, whereas __dest is
> not constant so the compiler shall assume it's written.

Does this "@" behaves as well with unrestricted pointers like just
(char *s)?

> I had to change the types from void to char so the size expressions
> would be meaningful; if you were actually to use this to implement
> memcpy, you'd wrap it in another inline function that casted the
> arguments.
> 
> I think that's all that should be needed.  Thoughts?

I've just tried this (on mine examples, with unrestricted pointers).
The things seem to be fine.  Not ideal (reloading suffers sometimes,
but this is not the @-specific problem), but completely free of the
problems introduced by "m".
