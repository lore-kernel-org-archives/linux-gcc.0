From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 17:30:46 -0500
Message-ID: <715D33AB-5F69-11D9-A9D4-000A95D692F4@physics.uc.edu>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <m3hdlwpv5h.fsf@uniton.integrable-solutions.net> <20050106032545.L1437@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <20050106032545.L1437@natasha.ward.six>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, Gabriel Dos Reis <gdr@integrable-solutions.net>


On Jan 5, 2005, at 5:25 PM, Denis Zaitsev wrote:
> But then another question: if libstdc++ itself has libm in its NEEDED
> list, why the whole app having libstdc++ in its NEEDED list is forced
> (by the linker?) to have libm there too?  While the app itself never
> really needs that libm?

Because that is not the way it should work.  If it works that way it is
just plainly wrong really.  All libraries which are needed by a shared
library should be listed, otherwise you get undefined behavior on
when libraries get initialized.  This has been discussed before,
go look it up.

-- Pinski

