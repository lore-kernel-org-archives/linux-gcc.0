From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Mon, 20 Dec 2004 16:38:36 -0500
Message-ID: <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu>
References: <20041221023548.A8330@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-patches-return-136776-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-patches-unsubscribe-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
List-Post: <mailto:gcc-patches@gcc.gnu.org>
List-Help: <mailto:gcc-patches-help@gcc.gnu.org>
Sender: gcc-patches-owner@gcc.gnu.org
In-Reply-To: <20041221023548.A8330@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>


On Dec 20, 2004, at 4:35 PM, Denis Zaitsev wrote:

> This patch is for exactly the same issue as described in
>
> http://gcc.gnu.org/ml/gcc/2002-12/msg00033.html
>
> The fix is exactly the same, just another file is the target.  Without
> it libobjc fails to build when --with-objc-gc is given to configure.

This patch is incorrect as noted before.  I am going to reject it
as it was rejected before.  Again libobjc has no reason to include
these headers.

Thanks,
Andrew Pinski
libobjc maintainer

