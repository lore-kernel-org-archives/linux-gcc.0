From: Mike Hearn <mike@navi.cx>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 05 Jan 2005 17:14:24 +0000
Message-ID: <pan.2005.01.05.17.14.24.807180@navi.cx>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-return-107624-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gcc@gcc.gnu.org
Cc: linux-gcc@vger.kernel.org

On Tue, 04 Jan 2005 18:06:51 -0500, Andrew Pinski wrote:
> Then write a better collect2 which only links in the libraries which
> are needed and have it find the needed libraries without supplying
> the option to link the library (yes this is on the TODO page of gcc).

I thought there was already an option for this in ld, --as-needed or
something.

I also find it strange (broken) that a c++ app that doesn't use any libm
symbols is linked to it anyway. Why does it matter? If stdc++ needs it
then fine, but the link tree should look like:

a.out
  - libc.so.6
  - libstdc++.so.6
       - libm.so.6
       - libc.so.6

and so on. Why does the link tree not look how you'd intuitively expect it
to?

