From: Denis Zaitsev <zzz@anda.ru>
Subject: [BUG] GCC 3.4.3/x86: -fomit-frame-pointer cause a lot of test failures for libstdc++
Date: Wed, 22 Dec 2004 08:42:19 +0500
Message-ID: <20041222084218.A14668@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-106999-gcc=m.gmane.org@gcc.gnu.org>
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

I've built GCC with -fomit-frame-pointer and -fno-omit-frame-pointer.
I mean either of these flags is present in both the exported shell
variables CFLAGS and CXXFLAGS and also in the BOOT_CFLAGS variable
from gcc/Makefile.  Both the builds was successfull.  And these are
some results of 'make check':


-fno-omit-frame-pointer:

                === libstdc++ Summary ===

# of expected passes            2720
# of unexpected failures        1
# of unexpected successes       1
# of expected failures          6


-fomit-frame-pointer:

                === libstdc++ Summary ===

# of expected passes            2364
# of unexpected failures        357
# of expected failures          7


So, the difference seems to be just huge.  Does it mean some serious
problems GCC has in the hard-fp-less area for x86?  (BTW, it
traditionally has some...)  The tests results for gcc and g++ are
different too, but that differencies are just miserable compared with
those listed.

Other details about the build and check environment:

CFLAGS, CXXFLAGS, BOOT_CFLAGS:

        -pipe
        -O3
        -fno-strength-reduce
        -fno-inline-functions
        -fno-align-functions
        -fno-align-loops
        -fno-align-jumps
        -fno-ident
        -f[no]omit-frame-pointer
        -D__USE_STRING_INLINES
        -mpreferred-stack-boundary=2

configure's args:

        --enable-shared
        --enable-static
        --disable-debug
        --disable-profile
        --disable-nls
        --disable-libtool-lock
        --disable-rpath
        --disable-largefile
        --with-gnu-as
        --with-gnu-ld
        --enable-threads=posix
        --enable-__cxa_atexit
        --enable-languages=c,c++,objc
        --enable-version-specific-runtime-libs
        --enable-clocale
        --enable-objc-gc
        --disable-checking
        --with-gc=simple
        --with-system-zlib
        --with-tune=pentium
