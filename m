From: Denis Zaitsev <zzz@anda.ru>
Subject: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 05:20:46 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031225052045.A18774@zzz.ward.six>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14164-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

From some moment in the past, the next input parameters are used here
and there in sysdeps/i386/i486/bits/string.h:

        "m" ( *(struct { char __x[0xfffffff]; } *)__s)

When I was seeking for the reasons to do so, I've found some
discussions about this in libc-alpha and gcc mailing lists.  As I
understand from there, there are an options - to use the "m" arg(s)
shown above or just to use "memory" in the list of a clobbered
registers.  So, the question is: why the "m"-way had been choosen?
I'm asking, because I've found that this "m"-way leads GCC to produce
an unoptimal enough assembler, while "memory" code is ok.

Let me describe.  This is some kind of typical inline-asm string
defun:

extern inline
_s2(const char *a, const char *b)
{
    asm volatile (
        "/*%0%1%2%3*/"
        :"+&r"(a), "+&r"(b)
        :"m"(*(struct{__extension__ char __x[0xfffffff];}*)a),
         "m"(*(struct{__extension__ char __x[0xfffffff];}*)b)
        :"cc"
    );
}

It's, of course, just an essence from the typical string defun, all
real elements, which aren't important for the demonstration, are
omited.  And the references for the asm operands inside the comment
are inserted - they will be healthy.  So, compile the next:

s2(const char *a, const char *b){return _s2(a,b);}

.globl s2
	.type	s2, @function
s2:
	pushl	%esi
	pushl	%ebx
	movl	12(%esp), %edx
	movl	16(%esp), %eax
	movl	%edx, %ebx
	movl	%eax, %esi
#APP
	/*%ebx%esi(%edx)(%eax)*/
#NO_APP
	popl	%ebx
	movl	%ecx, %eax
	popl	%esi
	ret

Obviously, the following is a garbage:

	pushl	%esi
	pushl	%ebx
	movl	%edx, %ebx
	movl	%eax, %esi
	popl	%ebx
	popl	%esi

And this is the "memory" variant:

extern inline
_s2(const char *a, const char *b)
{
    asm volatile (
        "/*%0%1*/"
        :"+&r"(a), "+&r"(b):
        :"cc", "memory"
    );
}

.globl s2
	.type	s2, @function
s2:
	movl	4(%esp), %edx
	movl	8(%esp), %eax
#APP
	/*%edx%eax*/
#NO_APP
	movl	%ecx, %eax
	ret

So, we've no garbage at all, only the very good assembler.

Then the next question is: am I understand right that the problem is
in the combination of the "earlyclobber" modifier of the asm operands
and the "m" with the corresponding args in the input list?  And for
some reason GCC decides that "m" is tied with arg itself vs. a memory
this arg points to, and so a separate copy of the arg is needed, as
the corresponding output operand is early clobbered?  The content of
the comment in the "m"-way defun shows (%edx)(%eax), but it seems that
GCC thinks about %edx%eax instead.  (But very may be I'm wrong - I
don't know these GCC internals.)

Well, this is a very simple example, but my investigation shows that
the situation is the same for any C code - either simple or complex.
Always some extra registers are used, some extra loads are emited etc.
So, if both the variants are correct, it should be healthy to use the
"memory" one (as I understand, there was a time when it was really
used in sysdeps/i386/i486/bits/string.h ?).  For example it's an
output from 'size libc.so' for the GLIBC-2.3.2 compiled with
-D__USE_STRING_INLINES:

   text	   data	    bss	    dec	    hex	filename
1108363	  11296	  10820	1130479	 113fef	libc.so

and this is the same, but if just the only one defun - __strcmp_gg -
is redone thru the "memory"-way:

   text    data     bss     dec     hex filename
1107779   11296   10820 1129895  113da7 libc.so

The difference of the text's sizes is a little over 0.5k.  And there
are tens of such defuns.  So, the third question is about redoing all
the inline-asm string functions that way (of course, if there are no
any cons here).
