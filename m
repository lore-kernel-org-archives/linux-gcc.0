From: Lukasz Michal Rak <L.Rak@elka.pw.edu.pl>
Subject: Re: x86 D flag: what's its status thru the program?
Date: Mon, 5 Jul 2004 15:23:44 +0200 (CEST)
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.58.0407051519010.27449@mion.elka.pw.edu.pl>
References: <20040704213748.A796@natasha.ward.six>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <20040704213748.A796@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org


	Hi all!

 The convention is that the D flag in IA32 is cleared. So if you call a
subroutine you have to clear D flag before making call. The subroutine can
change the state of D flag, but before returning the routine has to clear
the D flag.
 Hope I helped.

 Regards,

			Lukasz


> Is this Direction flag (for the movs instructions) has some assumed
> value (say, as after cld)?  I ask because the many program sources
> show interesting behaviour: from one side, this flag is always set
> before the string insns (cld or std), but from the other side, if the
> programs does std then it always does cld after.  So, nobody leaves it
> set, but nevertheless, everybody set it clear.  Why?
> -
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

