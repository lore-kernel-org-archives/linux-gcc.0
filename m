From: Denis Zaitsev <zzz@anda.ru>
Subject: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 03:01:02 +0500
Message-ID: <20050105030102.G1437@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107553-gcc=m.gmane.org@gcc.gnu.org>
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

I've found some strange behaviour of g++: if it's used to produce an
executable, i.e.:

        g++ xxx.C -o XXX

then that XXX is linked with libm.so, regardless of the fact that math
is not used in the program.  Also, libstdc++.so and libgcc_s.so are
linked too, even though they aren't needed as well.

But if g++ is used to compilation only, and the link stage is done by
gcc or ld, i.e:

        g++ -c xxx.C -o xxx.o
        gcc xxx.o -o XXX

then neither of that 3 libs are linked (of course, if they aren't
needed).

Why g++ does so?  Is it intentional?  Or how this can be solved?

GCC's in question are the current stable, 20041231 snapshot and all
the 3.x.x versions, as far as I remember.

Thanks in advance.
