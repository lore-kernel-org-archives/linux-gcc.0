From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: glibc 2.3
Date: Sat, 05 Oct 2002 20:35:57 +0100
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <m3elb4fzky.fsf@home.gmurray.org.uk>
References: <3D9C1775.9030503@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-9804-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <3D9C1775.9030503@redhat.com> (Ulrich Drepper's message of
 "Thu, 03 Oct 2002 03:09:57 -0700")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org, libc-alpha@sources.redhat.com

Ulrich Drepper <drepper@redhat.com> writes:


> The 2.3.x release should be binary compatible with the 2.2 and earlier
> releases.  All correct programs should continue to run. 

I have encountered what looks like a binary incompatibility since
upgrading from 2.2.5.

I received the error message "relocation error: symbol
__libc_stack_end, version GLIBC_2.1 not defined in file ld-linux.so.2
with link time reference". This was on a program built from source
using the same gcc3.2 and glibc 2.2.5 (SuSE). Recompiling while
running glibc 2.3 
