From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: Incorrect warning message?
Date: Sun, 16 Jan 2005 03:32:42 +0500
Message-ID: <20050116033242.B3181@natasha.ward.six>
References: <20050116020836.A2421@natasha.ward.six> <jesm52pcuf.fsf@sykes.suse.de>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <jesm52pcuf.fsf@sykes.suse.de>; from schwab@suse.de on Sat, Jan 15, 2005 at 11:05:44PM +0100
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Schwab <schwab@suse.de>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Sat, Jan 15, 2005 at 11:05:44PM +0100, Andreas Schwab wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> > It's an example:
> >
> > void c(const char *s){}
> > void cc(const char **p){}
> > void x()
> > {
> >     char *s;
> >     c(s);
> >     cc(&s);
> > }
> >
> > And it's the warning GCC produces for it:
> >
> > bug.c: In function `x':
> > bug.c:7: warning: passing arg 1 of `cc' from incompatible pointer type
> >
> > Is this message correct?
> 
> Read question 11.10 of the C faq.
> 
> http://www.eskimo.com/~scs/C-faq/q11.10.html

Thanks.  It's interesting.  :)
