From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 03:59:15 +0500
Message-ID: <20050105035915.I1437@natasha.ward.six>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net>
Mime-Version: 1.0
Return-path: <gcc-return-107566-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <m3u0pwq13m.fsf@uniton.integrable-solutions.net>; from gdr@integrable-solutions.net on Tue, Jan 04, 2005 at 11:30:05PM +0100
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gabriel Dos Reis <gdr@integrable-solutions.net>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Tue, Jan 04, 2005 at 11:30:05PM +0100, Gabriel Dos Reis wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> | 
> |   a) why g++ assumes that libstdc++ is always needed?
> 
> Because that is the way it is designed.  If you don't want libstdc++,
> say -nostdlib as explained in our documentation.

This doesn't work out of the box...  But yes, it can be a solution,
thanks.

> |   b) why is libm _always_ needed by libstdc++?
> 
> Because libstdc++ needs the mathematical functions.
> 
> |  It's rather strange.
> 
> I guess it is a matter of perspective.  From my part, requiring users
> to explicitly supply -lm is a bug.  Simply because the mathematical
> functions are part of the standard library; we do not require users to
> say -lstr when they use strcpy() and friend; we do not require users
> to say -lstdio when they use fprintf() and friends.  YMMV.

Ok, but do we force users to use libm every time libc is used?  No, we
don't.  Of course, we don't.  And I emphasised the word 'always':
not _every_ routine from libstdc++ need libm, but it always
required...

Anyway, could anybody say, where in sources these NEEDED libraries
come from?  If I was going to patch this just for my installations...
