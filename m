From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Mon, 20 Dec 2004 17:35:49 -0500
Message-ID: <7FCB96D2-52D7-11D9-9FB0-000A95D692F4@physics.uc.edu>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221024810.B8330@natasha.ward.six> <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu> <047968C8-52D3-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221032621.D8330@natasha.ward.six> <0E23C1A3-52D7-11D9-9FB0-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-patches-return-136790-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-patches-unsubscribe-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
List-Post: <mailto:gcc-patches@gcc.gnu.org>
List-Help: <mailto:gcc-patches-help@gcc.gnu.org>
Sender: gcc-patches-owner@gcc.gnu.org
In-Reply-To: <0E23C1A3-52D7-11D9-9FB0-000A95D692F4@physics.uc.edu>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org, Denis Zaitsev <zzz@anda.ru>, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>


On Dec 20, 2004, at 5:32 PM, Andrew Pinski wrote:

> Yes, this is what I applied to both the mainline and the 3.4 branch.
>
> Thanks,
> Andrew Pinski
>
> ChangeLog:

But with this changelog as I had forgot to put something about
BITS_PER_WORD.

2004-12-20  Andrew Pinski  <pinskia@physics.uc.edu>

         PR libobjc/12035
         * gc.c: Remove definition of LOGWL, modWORDSZ, and divWORDSZ 
since
         they are not used.
         Include limits.h and stdlib.h.
         Define BITS_PER_WORD.

Thanks,
Andrew Pinski

