From: Denis Zaitsev <zzz@anda.ru>
Subject: [new-ra] GCC-3.3.2/x86: some suspicious behaviour
Date: Thu, 8 Jul 2004 04:06:43 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040708040643.E17650@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-99033-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org
Cc: linux-gcc@vger.kernel.org

This source


extern inline
void *i(void *d, void *s, int n)
{
    __asm__ __volatile__ ( ""
        :"+&c"(n), "+&D"(d), "+&S"(s)
    );
}
void *o(void *d, void *s, int n)
{
    return i(d, s, n);
}


is compiled into that assembler:


o:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	movl	16(%esp), %esi
	movl	20(%esp), %ecx
	popl	%esi
	popl	%edi
	ret


Everything looks ok.  But the source modified slightly


extern inline
void *i(void *d, void *s, int n)
{
    __asm__ __volatile__ ( ""
        :"+&c"(n), "+&D"(d), "+&S"(s)
    );
    __asm__ __volatile__ ( ""
        :"+&c"(n), "+&D"(d), "+&S"(s)
    );
}
void *o(void *d, void *s, int n)
{
    return i(d, s, n);
}


is compiled into that assembler:


o:
	pushl	%edi
	pushl	%esi
	movl	12(%esp), %edi
	movl	20(%esp), %ecx
	movl	16(%esp), %esi
	movl	%ecx, 16(%esp)
	movl	%esi, 20(%esp)
	popl	%esi
	popl	%edi
	ret


So, what does these two commands mean:


	movl	%ecx, 16(%esp)
	movl	%esi, 20(%esp)


?  The options for the compiler are:


-O2 -fomit-frame-pointer -fnew-ra


The result is the same for any -O >0 and for -Os.  And the presence of
these suspicious commands are not affected by the frame-pointer
option.
