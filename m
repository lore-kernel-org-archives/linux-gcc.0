From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 03:18:47 +0500
Message-ID: <20050105031847.H1437@natasha.ward.six>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org>
Mime-Version: 1.0
Return-path: <gcc-return-107556-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <20050104220523.GA24316@nevyn.them.org>; from drow@false.org on Tue, Jan 04, 2005 at 05:05:23PM -0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Tue, Jan 04, 2005 at 05:05:23PM -0500, Daniel Jacobowitz wrote:
> On Wed, Jan 05, 2005 at 03:01:02AM +0500, Denis Zaitsev wrote:
> > I've found some strange behaviour of g++: if it's used to produce an
> > executable, i.e.:
> > 
> >         g++ xxx.C -o XXX
> > 
> > then that XXX is linked with libm.so, regardless of the fact that math
> > is not used in the program.  Also, libstdc++.so and libgcc_s.so are
> > linked too, even though they aren't needed as well.
> > 
> > But if g++ is used to compilation only, and the link stage is done by
> > gcc or ld, i.e:
> > 
> >         g++ -c xxx.C -o xxx.o
> >         gcc xxx.o -o XXX
> > 
> > then neither of that 3 libs are linked (of course, if they aren't
> > needed).
> > 
> > Why g++ does so?  Is it intentional?  Or how this can be solved?
> 
> drow@nevyn:~% readelf -d /usr/lib/libstdc++.so.6 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libm.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.6]

Thanks.

> Libstdc++ needs libm.

Then the other questions:

  a) why g++ assumes that libstdc++ is always needed?

  b) why is libm _always_ needed by libstdc++?  It's rather strange.

BTW, the same happens with Ada and libgnat - if I compile GCC from
scratch, then libgnat.so NEED libm.  But libgnat from, say, Debian
doesnt do so - it NEED libgcc_s.so only.  Where are some things
messed?
