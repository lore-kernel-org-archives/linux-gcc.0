From: Michael Riepe <michael@stud.uni-hannover.de>
Subject: Re: glibc 2.3.1: fix for the i386 inline strings code
Date: Tue, 7 Jan 2003 19:40:08 +0100
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20030107194008.43255@thrai.stud.uni-hannover.de>
References: <20030106063048.A32392@natasha.zzz.zzz> <u8u1gm7fwy.fsf@gromit.moeb> <20030107084301.A21395@natasha.zzz.zzz>
Mime-Version: 1.0
Return-path: <libc-alpha-return-10926-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20030107084301.A21395@natasha.zzz.zzz>; from Denis Zaitsev on Tue, Jan 07, 2003 at 08:43:01AM +0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@cd-club.ru>
Cc: Andreas Jaeger <aj@suse.de>, Ulrich Drepper <drepper@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Tue, Jan 07, 2003 at 08:43:01AM +0500, Denis Zaitsev wrote:
[...]
> The exact problem with XtNewString is that we have the "void pointer
> dereference" error when it is used with void* argument: XtNewString is
> a macros which uses strcpy, whose inline variant, in turn, uses
> __STRING_SMALL_GET(16|32), which don't cast their (str) argument to
> (char*).  The patch inserts such a casting.  But this is not the
> X-specific problem, I just met it when was compiling X.  It's a
> general error - string functions should work happily with void*
> arguments, so __STRING_SMALL_GET macros' must not assume their (str)
> argument can't be of type void*...

To be more specific: __STRING_SMALL_GET expects the (str) argument to
be an `unsigned char *'. Everything else will make it do funny things
when (signed) characters have values >= 128. Since __strcpy_a_small()
and __stpcpy_a_small() pass the pointer unmodified, they're broken as
well.

-- 
 Michael "Tired" Riepe <Michael.Riepe@stud.uni-hannover.de>
 "All I wanna do is have a little fun before I die"
