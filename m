From: Michel Lespinasse <walken@zoy.org>
Subject: Re: Why -fPIC stops some optimization?
Date: Fri, 9 Jul 2004 13:45:50 -0700
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040709204550.GA1962@zoy.org>
References: <20040709210230.C7162@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-99157-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <20040709210230.C7162@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Fri, Jul 09, 2004 at 09:02:30PM +0600, Denis Zaitsev wrote:
> I have met such a behaviour while compiling GLIBC for x86.  A
> construct which suffers looks like:
> 
> 
> #define __xyz(x,y,z) ({ \
>     ...                 \
>     size_t __n= (z);    \
>     ...                 \
>     switch (__n) {      \
>         case ...        \
>         ...             \
>     }                   \
>     ...                 \
> })

I can not comment about your specific case, but in the past I've had a
fairly similar issue with an inline function that had branches and was
supposed to be optimized out to straight-line code at the call site.

Try making __n a const and see if it helps. Yes, this is something
that gcc should really figure it out by itself.

-- 
Michel "Walken" Lespinasse
"In this time of war against Osama bin Laden and the oppressive
Taliban regime, we are thankful that OUR leader isn't the spoiled son
of a powerful politician from a wealthy oil family who is supported by
religious fundamentalists, operates through clandestine organizations,
has no respect for the democratic electoral process, bombs innocents,
and uses war to deny people their civil liberties." --The Boondocks
