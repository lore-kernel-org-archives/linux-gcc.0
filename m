From: Flemming Greve Skovengaard <dsl58893@vip.cybercity.dk>
Subject: Optimization flags
Date: Fri, 20 Jun 2003 00:07:03 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3EF23407.6040706@vip.cybercity.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc <linux-gcc@vger.kernel.org>

Hey, I'm playing around with the optimization flags for gcc.
I've set the enviroment varibles $CFLAGS and $CXXFLAGS, so it will
effect the compilation process went I build new packages from source.
$CFLAGS and $CXXFLAGS are set to:
-O2 -mcpu=athlon-xp -march=athlon-xp -mfpmath=sse -m3dnow -msse -mmmx

1) Is there anything I can do to get a better optimization (without
    changing the '-O2')?
2) Also is there anything wrong or redundant with my optimization?

My CPU is a Athlon Thoroughbred XP 2600+

-- 
Flemming Greve Skovengaard               Man still has one belief,
a.k.a Greven                             One decree that stands alone
<dsl58893@vip.cybercity.dk>              The laying down of arms
4168.08 BogoMIPS                         Is like cancer to their bones

