From: Denis Zaitsev <zzz@anda.ru>
Subject: Why -fPIC stops some optimization?
Date: Fri, 9 Jul 2004 21:02:30 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040709210230.C7162@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-99140-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

I have met such a behaviour while compiling GLIBC for x86.  A
construct which suffers looks like:


#define __xyz(x,y,z) ({ \
    ...                 \
    size_t __n= (z);    \
    ...                 \
    switch (__n) {      \
        case ...        \
        ...             \
    }                   \
    ...                 \
})


This macro is intended for use with some constant z
(__builtin_constant_p(z) is true).  And when this macro is used such a
way, GCC should unroll (or what is the word for this?) the switch into
the only branch which is needed.  And GCC does this optimization, but
only not for the -fPIC case.  There GCC emits the whole body for the
switch operator and then does just a jump for the correct branch.
Why?  Or it is some expected misbehaviour for the -fPIC case?

GCC-3.3.2.

Thanks in advance.
