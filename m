From: Denis Zaitsev <zzz@anda.ru>
Subject: Incorrect warning message?
Date: Sun, 16 Jan 2005 02:08:36 +0500
Message-ID: <20050116020836.A2421@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-108211-gcc=m.gmane.org@gcc.gnu.org>
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

It's an example:

void c(const char *s){}
void cc(const char **p){}
void x()
{
    char *s;
    c(s);
    cc(&s);
}

And it's the warning GCC produces for it:

bug.c: In function `x':
bug.c:7: warning: passing arg 1 of `cc' from incompatible pointer type

Is this message correct?  Doesn't the <const char> for the second
defun's declaration mean exactly the same as it means for the first -
the fact that defun doesn't modify the content of the corresponding
array?
