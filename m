From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Mon, 20 Dec 2004 17:48:17 -0500
Message-ID: <3D452AB0-52D9-11D9-9FB0-000A95D692F4@physics.uc.edu>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221024810.B8330@natasha.ward.six> <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu> <047968C8-52D3-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221032621.D8330@natasha.ward.six> <0E23C1A3-52D7-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221034637.A13027@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-patches-return-136792-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-patches-unsubscribe-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
List-Post: <mailto:gcc-patches@gcc.gnu.org>
List-Help: <mailto:gcc-patches-help@gcc.gnu.org>
Sender: gcc-patches-owner@gcc.gnu.org
In-Reply-To: <20041221034637.A13027@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>


On Dec 20, 2004, at 5:46 PM, Denis Zaitsev wrote:

> Ok.  Does it means that something alike should be applied for the
> files, which are including coretypes.h and tm.h for now?

Those are more complex and will not be fixed until 4.1.

-- Pinski

