From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: strcmp is too heavy for its everyday usage...
Date: Fri, 9 Jan 2004 10:11:45 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040109101145.A8801@zzz.ward.six>
References: <20040108060924.A4431@zzz.ward.six> <200401080113.i081DB1c000920@magilla.sf.frob.com> <20040108063636.C11508@zzz.ward.six> <jeoetehjoj.fsf@sykes.suse.de>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14366-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <jeoetehjoj.fsf@sykes.suse.de>; from schwab@suse.de on Thu, Jan 08, 2004 at 10:30:04AM +0100
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Schwab <schwab@suse.de>
Cc: Roland McGrath <roland@redhat.com>, Zack Weinberg <zack@codesourcery.com>, Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

On Thu, Jan 08, 2004 at 10:30:04AM +0100, Andreas Schwab wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> > On Wed, Jan 07, 2004 at 05:13:11PM -0800, Roland McGrath wrote:
> >
> >> The optimized string functions already do word comparisons when
> >> that is possible and advantageous.  The comparisons to extract
> >> the ordering vs just equality/nonequality are only on the first
> >> nonmatching byte.
> >
> > But it's an overhead anyway.
> 
> Rather neglectable, IMHO.

Nearly agreed.

> > Then, it's bad enough for the inlining.
> 
> If it's inlined then the compiler should be smart enough to discard
> the unneded bits.  If not, and the difference is measurable, then
> the compiler should be fixed.

GCC is smart enough.  It doesn't do the job thru the best possible
way, but this should and (important!) can really be fixed.  So,
generally I agree again.  But suppose such an example:

extern inline
s(const unsigned char *a, const unsigned char *b)
{
    int r;
    (r= a[0] - b[0]) &&
    (r= a[1] - b[1]) &&
    (r= a[2] - b[2]) &&
    (r= a[3] - b[3]);
    return r;
}

It's a typical inline code for compare 4-byte of mem.  When it is
used, say, in such a context

        s(a,b) ? A() : B();

GCC discards the value of r perfectly, leaving the only code needed
for compare bytes for eq/neq.  But GCC doesn't merge the 4 byte
comparing into single word comparing.  And, as I understand, it will
never do that, as it's not asked to.  Or this kind of optimization is
assumed ok for compiler, but just still unimplemented?

