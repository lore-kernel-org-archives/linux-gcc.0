From: Michel Lespinasse <walken@zoy.org>
Subject: Re: Why -fPIC stops some optimization?
Date: Sun, 11 Jul 2004 15:28:47 -0700
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040711222846.GA16559@zoy.org>
References: <20040709210230.C7162@natasha.ward.six>
	<20040709204550.GA1962@zoy.org>
	<20040710035800.D7162@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-99217-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <20040710035800.D7162@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Sat, Jul 10, 2004 at 03:58:01AM +0600, Denis Zaitsev wrote:
> > Try making __n a const and see if it helps. Yes, this is something
> > that gcc should really figure it out by itself.
> 
> This is the same way I'm curing the problem for now.  Making the subst
> variable const or using (z) directly in a statement-expression really
> helps.  But, nevertheless, is this limitation is switch operator
> specific?  Or is it a limit for optimization GCC can do, and it's
> reached faster when the PIC-code is generated?  Or what's wrong?

I can't really help you on this one - I'm just another gcc user.

All I know is, sometimes (often) gcc fails to see that some variable
is only assigned a constant once and never touched anywhere else, and
fails to optimize out that variable as a constant expression. When I
notice this, it's usualy possible to work around the issue by making
that variable a const. I have no idea why gcc does not notice the
obvious by itself though.

Cheers,

-- 
Michel "Walken" Lespinasse
"In this time of war against Osama bin Laden and the oppressive
Taliban regime, we are thankful that OUR leader isn't the spoiled son
of a powerful politician from a wealthy oil family who is supported by
religious fundamentalists, operates through clandestine organizations,
has no respect for the democratic electoral process, bombs innocents,
and uses war to deny people their civil liberties." --The Boondocks
