From: Gabriel Dos Reis <gdr@integrable-solutions.net>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: 04 Jan 2005 23:30:05 +0100
Message-ID: <m3u0pwq13m.fsf@uniton.integrable-solutions.net>
References: <20050105030102.G1437@natasha.ward.six>
	<20050104220523.GA24316@nevyn.them.org>
	<20050105031847.H1437@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107562-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050105031847.H1437@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

| On Tue, Jan 04, 2005 at 05:05:23PM -0500, Daniel Jacobowitz wrote:
| > On Wed, Jan 05, 2005 at 03:01:02AM +0500, Denis Zaitsev wrote:
| > > I've found some strange behaviour of g++: if it's used to produce an
| > > executable, i.e.:
| > > 
| > >         g++ xxx.C -o XXX
| > > 
| > > then that XXX is linked with libm.so, regardless of the fact that math
| > > is not used in the program.  Also, libstdc++.so and libgcc_s.so are
| > > linked too, even though they aren't needed as well.
| > > 
| > > But if g++ is used to compilation only, and the link stage is done by
| > > gcc or ld, i.e:
| > > 
| > >         g++ -c xxx.C -o xxx.o
| > >         gcc xxx.o -o XXX
| > > 
| > > then neither of that 3 libs are linked (of course, if they aren't
| > > needed).
| > > 
| > > Why g++ does so?  Is it intentional?  Or how this can be solved?
| > 
| > drow@nevyn:~% readelf -d /usr/lib/libstdc++.so.6 | grep NEEDED
| >  0x00000001 (NEEDED)                     Shared library: [libm.so.6]
| >  0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
| >  0x00000001 (NEEDED)                     Shared library: [libc.so.6]
| 
| Thanks.
| 
| > Libstdc++ needs libm.
| 
| Then the other questions:
| 
|   a) why g++ assumes that libstdc++ is always needed?

Because that is the way it is designed.  If you don't want libstdc++,
say -nostdlib as explained in our documentation.

|   b) why is libm _always_ needed by libstdc++?

Because libstdc++ needs the mathematical functions.

|  It's rather strange.

I guess it is a matter of perspective.  From my part, requiring users
to explicitly supply -lm is a bug.  Simply because the mathematical
functions are part of the standard library; we do not require users to
say -lstr when they use strcpy() and friend; we do not require users
to say -lstdio when they use fprintf() and friends.  YMMV.

-- Gaby

