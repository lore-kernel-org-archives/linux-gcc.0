From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: strcmp is too heavy for its everyday usage...
Date: Thu, 8 Jan 2004 06:36:36 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040108063636.C11508@zzz.ward.six>
References: <20040108060924.A4431@zzz.ward.six> <200401080113.i081DB1c000920@magilla.sf.frob.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14352-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <200401080113.i081DB1c000920@magilla.sf.frob.com>; from roland@redhat.com on Wed, Jan 07, 2004 at 05:13:11PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland McGrath <roland@redhat.com>
Cc: Zack Weinberg <zack@codesourcery.com>, Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Wed, Jan 07, 2004 at 05:13:11PM -0800, Roland McGrath wrote:

> The optimized string functions already do word comparisons when that
> is possible and advantageous.  The comparisons to extract the
> ordering vs just equality/nonequality are only on the first
> nonmatching byte.

But it's an overhead anyway.  Then, it's bad enough for the inlining.
And then, where is such a strcmp in GLIBC?
