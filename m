From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [BUG] GCC 3.4-20041224: __attribute__ ((regparm)) misbehaviour
Date: Tue, 28 Dec 2004 08:54:29 +0500
Message-ID: <20041228085429.D1437@natasha.ward.six>
References: <20041228084407.C1437@natasha.ward.six> <83F66334-5883-11D9-9D38-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <83F66334-5883-11D9-9D38-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Mon, Dec 27, 2004 at 10:49:46PM -0500
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Mon, Dec 27, 2004 at 10:49:46PM -0500, Andrew Pinski wrote:
> 
> On Dec 27, 2004, at 10:44 PM, Denis Zaitsev wrote:
> 
> > This program:
> >
> >
> > static
> > int x(int y)
> > __attribute__ ((regparm(1)));
> >
> > static
> > int x(int y)
> > {
> >     return y;
> > }
> >
> 
> No this is not a bug. You need regparm attribute on the function
> definition too.

Hmm...  Is it regparm-only related?  And is it something new though?
GCC 3.3.x doesnt show this behaviour.
