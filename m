From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Thu, 25 Dec 2003 06:38:50 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031225063850.A7869@zzz.ward.six>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225060850.C7419@zzz.ward.six> <20031225012711.GD13447@redhat.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14170-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <20031225012711.GD13447@redhat.com>; from rth@redhat.com on Wed, Dec 24, 2003 at 05:27:11PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@redhat.com>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Wed, Dec 24, 2003 at 05:27:11PM -0800, Richard Henderson wrote:
> On Thu, Dec 25, 2003 at 06:08:50AM +0500, Denis Zaitsev wrote:
> > Do you mean a kind of a complain that "X" does't work as it should?
> 
> Rather, that it could work better.

Ok.  BTW, I was looking around a little - and it seems that "m" suits
better here than "X" - we deals with a memory operand, not with "Any
operand whatsoever" (according to the documentation).  But you suggest
"X" (and this is not the first time).  Why?
