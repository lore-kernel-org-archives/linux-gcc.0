From: Gabriel Dos Reis <gdr@integrable-solutions.net>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: 05 Jan 2005 01:40:39 +0100
Message-ID: <m3brc4pv20.fsf@uniton.integrable-solutions.net>
References: <20050105030102.G1437@natasha.ward.six>
	<20050104220523.GA24316@nevyn.them.org>
	<20050105031847.H1437@natasha.ward.six>
	<m3u0pwq13m.fsf@uniton.integrable-solutions.net>
	<20050105035915.I1437@natasha.ward.six>
	<51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: Denis Zaitsev <zzz@anda.ru>, gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Andrew Pinski <pinskia@physics.uc.edu> writes:

| Also note on some targets like darwin, libm is included in libsystem
| (aka
| libc) by default.

Indeed.  I've always found it an extraordinary definition of libc that
leaves out the mathematical functions, as if cos() or sin() or atan()
were not part of the C standard library.

-- Gaby
