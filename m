From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: Why -fPIC stops some optimization?
Date: Sat, 10 Jul 2004 03:58:01 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040710035800.D7162@natasha.ward.six>
References: <20040709210230.C7162@natasha.ward.six> <20040709204550.GA1962@zoy.org>
Mime-Version: 1.0
Return-path: <gcc-return-99161-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <20040709204550.GA1962@zoy.org>; from walken@zoy.org on Fri, Jul 09, 2004 at 01:45:50PM -0700
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michel Lespinasse <walken@zoy.org>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Fri, Jul 09, 2004 at 01:45:50PM -0700, Michel Lespinasse wrote:
> On Fri, Jul 09, 2004 at 09:02:30PM +0600, Denis Zaitsev wrote:
> > I have met such a behaviour while compiling GLIBC for x86.  A
> > construct which suffers looks like:
> > 
> > 
> > #define __xyz(x,y,z) ({ \
> >     ...                 \
> >     size_t __n= (z);    \
> >     ...                 \
> >     switch (__n) {      \
> >         case ...        \
> >         ...             \
> >     }                   \
> >     ...                 \
> > })
> 
> I can not comment about your specific case, but in the past I've had a
> fairly similar issue with an inline function that had branches and was
> supposed to be optimized out to straight-line code at the call site.
> 
> Try making __n a const and see if it helps. Yes, this is something
> that gcc should really figure it out by itself.

This is the same way I'm curing the problem for now.  Making the subst
variable const or using (z) directly in a statement-expression really
helps.  But, nevertheless, is this limitation is switch operator
specific?  Or is it a limit for optimization GCC can do, and it's
reached faster when the PIC-code is generated?  Or what's wrong?
