From: Denis Zaitsev <zzz@anda.ru>
Subject: BUG: g++ 3.x.x -fomit-frame-pointer: exception handling doesn't work
Date: Sat, 7 Aug 2004 20:22:57 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040807202257.A5885@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-100364-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Consider the following example:


#include <stdio.h>

int x(int y)
{
    int x= y;
    if (y)
        printf("%d\n", y);
    else
        throw "x";
    return x;
}

main()
{
    try {
        x(0);
    }
    catch (const char *e) {
        puts(e);
    }
    catch (...) {
        puts("cathed");
    }
}


When compiled without -fomit-frame-pointer, it behaves ok: it prints
'x'.  But if compiled with the option, it prints just 'Aborted',
i.e. no exception is catched at all.

A little research shows, that it's stack-related problem (probably,
stack -> dwarf info related): the presence of the printf call in the
x() function makes GCC to allocate the x variable in the 'value'
register, not corrupted by the printf call.  It's %ebx here.  And so,
GCC does push %ebx in the prologue.  And then the exception handling
mechanism dies.  If the stack is unmodified at the moment of 'throw
"x"', then the mechanism is ok.  This is the case, if the printf call
is removed and the x variable is allocated in a 'cheap' register,
which is not needed to be saved in the stack.

And, finally, as far as I understand, when the frame pointer register
is used, all the stack frame questions are resolved thru it and the
problem described just do not arise.
