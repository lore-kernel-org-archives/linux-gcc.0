From: Denis Zaitsev <zzz@anda.ru>
Subject: [BUG] GCC 3.4-20041224: __attribute__ ((regparm)) misbehaviour
Date: Tue, 28 Dec 2004 08:44:07 +0500
Message-ID: <20041228084407.C1437@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107171-gcc=m.gmane.org@gcc.gnu.org>
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

This program:


static
int x(int y)
__attribute__ ((regparm(1)));

static
int x(int y)
{
    return y;
}


can't be compiled with GCC 3.4.4 20041224.  The compiler complains:


y-bug.c:7: error: conflicting types for 'x'
y-bug.c:3: error: previous declaration of 'x' was here
y-bug.c:7: error: conflicting types for 'x'
y-bug.c:3: error: previous declaration of 'x' was here


It seems that it's a bug.
