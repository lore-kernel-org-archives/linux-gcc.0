From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [BUG] GCC 3.4.3/x86: -fomit-frame-pointer cause a lot of test failures for libstdc++
Date: Thu, 23 Dec 2004 03:20:33 +0500
Message-ID: <20041223032033.D14668@natasha.ward.six>
References: <20041222084218.A14668@natasha.ward.six> <D23532B5-53CE-11D9-95A4-000A95D692F4@physics.uc.edu> <20041223011327.C14668@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107041-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <20041223011327.C14668@natasha.ward.six>; from zzz@anda.ru on Thu, Dec 23, 2004 at 01:13:27AM +0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Thu, Dec 23, 2004 at 01:13:27AM +0500, Denis Zaitsev wrote:
> I'm trying the patches.  Make check is still going and this should
> take the couple more hours.

Ok, it's finushed.  The libstdc++ results are:


# of expected passes            2366
# of unexpected failures        355
# of expected failures          7


There are 2 less failures...
