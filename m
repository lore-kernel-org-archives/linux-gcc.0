From: Jakub Jelinek <jakub@redhat.com>
Subject: Re: glibc 2.3
Date: Sat, 5 Oct 2002 21:39:26 +0200
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20021005213926.C3451@sunsite.ms.mff.cuni.cz>
References: <3D9C1775.9030503@redhat.com> <m3elb4fzky.fsf@home.gmurray.org.uk>
Reply-To: Jakub Jelinek <jakub@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-9805-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <m3elb4fzky.fsf@home.gmurray.org.uk>; from graham@gmurray.org.uk on Sat, Oct 05, 2002 at 08:35:57PM +0100
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Graham Murray <graham@gmurray.org.uk>
Cc: linux-gcc@vger.kernel.org, libc-alpha@sources.redhat.com

On Sat, Oct 05, 2002 at 08:35:57PM +0100, Graham Murray wrote:
> Ulrich Drepper <drepper@redhat.com> writes:
> 
> 
> > The 2.3.x release should be binary compatible with the 2.2 and earlier
> > releases.  All correct programs should continue to run. 
> 
> I have encountered what looks like a binary incompatibility since
> upgrading from 2.2.5.
> 
> I received the error message "relocation error: symbol
> __libc_stack_end, version GLIBC_2.1 not defined in file ld-linux.so.2
> with link time reference". This was on a program built from source
> using the same gcc3.2 and glibc 2.2.5 (SuSE). Recompiling while
> running glibc 2.3 

__libc_stack_end is part of glibc private interface, libraries other
then the ones contained in glibc or programs must not use it.
The private interfaces has been moved to GLIBC_PRIVATE symbol version
to catch broken programs/libraries and also to document what is and what
is not considered to be private interface in a clear way.

	Jakub
