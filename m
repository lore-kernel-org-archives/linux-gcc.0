From: Denis Zaitsev <zzz@cd-club.ru>
Subject: Re: glibc 2.3.1: fix for the i386 inline strings code
Date: Tue, 7 Jan 2003 08:43:01 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20030107084301.A21395@natasha.zzz.zzz>
References: <20030106063048.A32392@natasha.zzz.zzz> <u8u1gm7fwy.fsf@gromit.moeb>
Mime-Version: 1.0
Return-path: <libc-alpha-return-10916-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <u8u1gm7fwy.fsf@gromit.moeb>; from aj@suse.de on Mon, Jan 06, 2003 at 11:04:29AM +0100
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>
Cc: Ulrich Drepper <drepper@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Mon, Jan 06, 2003 at 11:04:29AM +0100, Andreas Jaeger wrote:
> Denis Zaitsev <zzz@cd-club.ru> writes:
> 
> > Nobody has answered to me for a while, so I'm resending this
> > politely...
> >
> > This is a trivial patch for the inlined i386 strings' header.  Without
> > it, say, X11 can't be compiled with -D__USE_STRING_INLINES - a
> > problems will be caused by XtNewString and X11's own bzero.  These
> 
> What exactly is the problem with X11?
> 
> Andreas
> 

The exact problem with XtNewString is that we have the "void pointer
dereference" error when it is used with void* argument: XtNewString is
a macros which uses strcpy, whose inline variant, in turn, uses
__STRING_SMALL_GET(16|32), which don't cast their (str) argument to
(char*).  The patch inserts such a casting.  But this is not the
X-specific problem, I just met it when was compiling X.  It's a
general error - string functions should work happily with void*
arguments, so __STRING_SMALL_GET macros' must not assume their (str)
argument can't be of type void*...

Again, the second problem is not X-specific, but X-exposed (for me).
X's bzero is defined as memset, and when we have something like
        bzero(..., col = screen->max_col + 1)
the inlined memset, which is a macros, dies, because there is no
brackets around the second bzero's argument, where it is used in the
macros.  And, again, it is a general error - the brackets must be
there.  The second chunk of the patch cures this.
