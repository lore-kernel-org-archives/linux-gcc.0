From: Mike Hearn <mike@navi.cx>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 05 Jan 2005 19:10:28 +0000
Message-ID: <1104952228.3083.10.camel@littlegreen>
References: <20050105030102.G1437@natasha.ward.six>
	 <20050104220523.GA24316@nevyn.them.org>
	 <20050105031847.H1437@natasha.ward.six>
	 <m3u0pwq13m.fsf@uniton.integrable-solutions.net>
	 <20050105035915.I1437@natasha.ward.six>
	 <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>
	 <pan.2005.01.05.17.14.24.807180@navi.cx>
	 <9AA708C4-5F46-11D9-A9D4-000A95D692F4@physics.uc.edu>
	 <1104951115.3083.7.camel@littlegreen>
	 <5AAC834E-5F4A-11D9-A9D4-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-107637-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <5AAC834E-5F4A-11D9-A9D4-000A95D692F4@physics.uc.edu>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Wed, 2005-01-05 at 13:48 -0500, Andrew Pinski wrote:
> Again why are you complaining when a good dynamic loader will not load
> the needed libraries unless they are really needed?

You can't do that for ELF, you have no idea what libraries symbols are
meant to come from. The NEEDED entries in a binary are how the loader
knows what's needed and what's not, as the name implies. There's no way
to strip these entries once the binary has been built (except taking
them away one at a time and seeing if anything breaks ...) so it's
better if the compiler/linker does it.

