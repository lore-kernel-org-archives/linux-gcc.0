From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 13:48:13 -0500
Message-ID: <5AAC834E-5F4A-11D9-A9D4-000A95D692F4@physics.uc.edu>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu> <pan.2005.01.05.17.14.24.807180@navi.cx> <9AA708C4-5F46-11D9-A9D4-000A95D692F4@physics.uc.edu> <1104951115.3083.7.camel@littlegreen>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-107635-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <1104951115.3083.7.camel@littlegreen>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Hearn <mike@navi.cx>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org


On Jan 5, 2005, at 1:51 PM, Mike Hearn wrote:

> On Wed, 2005-01-05 at 13:21 -0500, Andrew Pinski wrote:
>> Well then make binutils change over --as-needed to be default.
>
> Tried, it doesn't work, there are too many broken libraries in the 
> world
> that don't correctly enumerate their dependencies in the NEEDED 
> section.
> Instead they rely on the user of the library to complete the set when
> they use it :(

Again why are you complaining when a good dynamic loader will not load
the needed libraries unless they are really needed?

-- Pinski

