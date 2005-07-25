From: Denis Zaitsev <zzz@anda.ru>
Subject: [BUG] gcc-3.4.5-20050531 (i386): __FUNCTION__ as a part of the printf's format argument
Date: Mon, 25 Jul 2005 14:41:32 +0600
Message-ID: <20050725144132.A18786@ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-117666-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Such an example can't be compiled:


#include <stdio.h>

void x()
{
    printf(__FUNCTION__ "\n");
}


$ gcc printf.c -o fprintf
printf.c: In function `x':
printf.c:5: error: syntax error before string constant


Then, the problem is not printf-specific and is not depend of
<stdio.h>.  The next example gives the same error:


void y(const char *f, ...);
void z()
{
    y(__FUNCTION__ "\n");
}


If some args are present in the ellipsis section (i.e. y(__FUNCTION__
": %s\n", "xxx")), the problem doesn't vanish.  And, if __FILE__ is
used instead of __FUNCTION__, the problem is absent.
