From: Keld =?iso-8859-1?Q?J=F8rn?= Simonsen <keld@dkuug.dk>
Subject: Re: glibc 2.3
Date: Tue, 15 Oct 2002 17:57:23 +0200
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20021015155723.GA3911@rap.rap.dk>
References: <3D9C1775.9030503@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-9928-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <3D9C1775.9030503@redhat.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Drepper <drepper@redhat.com>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Thu, Oct 03, 2002 at 03:09:57AM -0700, Ulrich Drepper wrote:
> 
> * Contents of the LC_* and LANG environment variables in the CEN style are
>   not recognized anymore.   It never was used.  Change by Ulrich Drepper.

Yes, I can understand it has not really been used. But it is not just
CEN ENV 12005 that has these naming rules, they are also in the ISO Cultural
Registry standard ISO/IEC 15897 (which is a fasttrack of the CEN
prestandard). And it is one of the things that my Unicode collegueges
are asking for in the revision of the ISO 15897 standard, so there must
be something good in it.  Would it be possible to roll this in again?

Best regards
keld
