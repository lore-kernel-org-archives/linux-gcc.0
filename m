From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 13:21:23 -0500
Message-ID: <9AA708C4-5F46-11D9-A9D4-000A95D692F4@physics.uc.edu>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu> <pan.2005.01.05.17.14.24.807180@navi.cx>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-107631-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <pan.2005.01.05.17.14.24.807180@navi.cx>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Hearn <mike@navi.cx>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org


On Jan 5, 2005, at 12:14 PM, Mike Hearn wrote:

> On Tue, 04 Jan 2005 18:06:51 -0500, Andrew Pinski wrote:
>> Then write a better collect2 which only links in the libraries which
>> are needed and have it find the needed libraries without supplying
>> the option to link the library (yes this is on the TODO page of gcc).
>
> I thought there was already an option for this in ld, --as-needed or
> something.

Well then make binutils change over --as-needed to be default.


> I also find it strange (broken) that a c++ app that doesn't use any 
> libm
> symbols is linked to it anyway. Why does it matter?

because libstdc++ might pull in libm symbols without the person knowing
he did.

-- Pinski

