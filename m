From: Gabriel Dos Reis <gdr@integrable-solutions.net>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: 05 Jan 2005 23:39:29 +0100
Message-ID: <m3k6qr8pr2.fsf@uniton.integrable-solutions.net>
References: <20050105030102.G1437@natasha.ward.six>
	<20050104220523.GA24316@nevyn.them.org>
	<20050105031847.H1437@natasha.ward.six>
	<m3u0pwq13m.fsf@uniton.integrable-solutions.net>
	<20050105035915.I1437@natasha.ward.six>
	<51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>
	<pan.2005.01.05.17.14.24.807180@navi.cx>
	<9AA708C4-5F46-11D9-A9D4-000A95D692F4@physics.uc.edu>
	<20050106030954.K1437@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107651-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050106030954.K1437@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: Andrew Pinski <pinskia@physics.uc.edu>, Mike Hearn <mike@navi.cx>, gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

| On Wed, Jan 05, 2005 at 01:21:23PM -0500, Andrew Pinski wrote:
| > 
| > On Jan 5, 2005, at 12:14 PM, Mike Hearn wrote:
| > 
| > > I also find it strange (broken) that a c++ app that doesn't use any 
| > > libm
| > > symbols is linked to it anyway. Why does it matter?
| > 
| > because libstdc++ might pull in libm symbols without the person knowing
| > he did.
| 
| Ok.  But the question in general is not about that.  It is not a
| problem that libm is NEEDED by libstdc++, but why this NEEDED leads to
| the same NEEDED for the app?  Isn't the first depndency enough?

At this point I completely lose track of what your problem is and what
you're complaining about.

-- Gaby
