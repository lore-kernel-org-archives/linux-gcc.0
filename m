From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [BUG] GCC 3.4-20041224: __attribute__ ((regparm)) misbehaviour
Date: Mon, 27 Dec 2004 22:49:46 -0500
Message-ID: <83F66334-5883-11D9-9D38-000A95D692F4@physics.uc.edu>
References: <20041228084407.C1437@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-107172-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20041228084407.C1437@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org


On Dec 27, 2004, at 10:44 PM, Denis Zaitsev wrote:

> This program:
>
>
> static
> int x(int y)
> __attribute__ ((regparm(1)));
>
> static
> int x(int y)
> {
>     return y;
> }
>

No this is not a bug. You need regparm attribute on the function
definition too.

-- Pinski

