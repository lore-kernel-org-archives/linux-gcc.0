From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Thu, 6 Jan 2005 03:30:03 +0500
Message-ID: <20050106033003.M1437@natasha.ward.six>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu> <pan.2005.01.05.17.14.24.807180@navi.cx> <9AA708C4-5F46-11D9-A9D4-000A95D692F4@physics.uc.edu> <20050106030954.K1437@natasha.ward.six> <6D7AEFE6-5F67-11D9-A9D4-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <gcc-return-107648-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <6D7AEFE6-5F67-11D9-A9D4-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Wed, Jan 05, 2005 at 05:16:20PM -0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, Mike Hearn <mike@navi.cx>

On Wed, Jan 05, 2005 at 05:16:20PM -0500, Andrew Pinski wrote:
> 
> On Jan 5, 2005, at 5:09 PM, Denis Zaitsev wrote:
> 
> > Ok.  But the question in general is not about that.  It is not a
> > problem that libm is NEEDED by libstdc++, but why this NEEDED leads to
> > the same NEEDED for the app?  Isn't the first depndency enough?
> 
> No, because some of libstdc++ code is in the headers, on some targets
> have two level namespaces which causes this to be rejected.

Sorry, what to be rejected?
