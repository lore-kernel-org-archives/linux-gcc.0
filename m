From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 07:08:56 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031225070856.G7419@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225060850.C7419@zzz.ward.six> <20031225012711.GD13447@redhat.com> <20031225063850.A7869@zzz.ward.six> <20031225015353.GE13447@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14173-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20031225015353.GE13447@redhat.com>; from rth@redhat.com on Wed, Dec 24, 2003 at 05:53:53PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org
Cc: Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>

On Wed, Dec 24, 2003 at 05:53:53PM -0800, Richard Henderson wrote:
> Because "m" implies (1) that the address must be valid and
> (2) that the address is used.

Ok.  What's wrong here for the typical string function?  _May be_ (1),
but in this case we'll get SIGSEGV and oter issues will lose a
sense...
