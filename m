From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: x86 D flag: what's its status thru the program?
Date: Mon, 5 Jul 2004 22:26:48 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040705222647.A17650@natasha.ward.six>
References: <20040704213748.A796@natasha.ward.six> <Pine.GSO.4.58.0407051519010.27449@mion.elka.pw.edu.pl>
Mime-Version: 1.0
Return-path: <gcc-return-98864-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0407051519010.27449@mion.elka.pw.edu.pl>; from L.Rak@elka.pw.edu.pl on Mon, Jul 05, 2004 at 03:23:44PM +0200
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Michal Rak <L.Rak@elka.pw.edu.pl>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Mon, Jul 05, 2004 at 03:23:44PM +0200, Lukasz Michal Rak wrote:
> 
> 	Hi all!
> 
>  The convention is that the D flag in IA32 is cleared. So if you call a
> subroutine you have to clear D flag before making call.

Do you mean that 'I have to clear the D flag if I had set it somewhere
before?'  Else what is the sense of the convention?

> The subroutine can change the state of D flag, but before returning
> the routine has to clear the D flag.

If the subroutine can change the flag, that it will violate the
convention, won't it?  And what is the strength of the convention,
again?

>  Hope I helped.

Thanks, but I still don't understand something.  Again: if every
procedure keeps the flag clear at exit, then why the same every
procedure clears it at entry?  In a suspicion, that caller has changed
the flag against the rules?

>  Regards,
> 
> 			Lukasz
> 
> 
> > Is this Direction flag (for the movs instructions) has some assumed
> > value (say, as after cld)?  I ask because the many program sources
> > show interesting behaviour: from one side, this flag is always set
> > before the string insns (cld or std), but from the other side, if the
> > programs does std then it always does cld after.  So, nobody leaves it
> > set, but nevertheless, everybody set it clear.  Why?
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
