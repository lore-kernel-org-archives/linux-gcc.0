From: Andreas Schwab <schwab@suse.de>
Subject: Re: strcmp is too heavy for its everyday usage...
Date: Thu, 08 Jan 2004 10:30:04 +0100
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <jeoetehjoj.fsf@sykes.suse.de>
References: <20040108060924.A4431@zzz.ward.six>
	<200401080113.i081DB1c000920@magilla.sf.frob.com>
	<20040108063636.C11508@zzz.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <libc-alpha-return-14355-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20040108063636.C11508@zzz.ward.six> (Denis Zaitsev's message
 of "Thu, 8 Jan 2004 06:36:36 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Roland McGrath <roland@redhat.com>
Cc: Zack Weinberg <zack@codesourcery.com>, Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

> On Wed, Jan 07, 2004 at 05:13:11PM -0800, Roland McGrath wrote:
>
>> The optimized string functions already do word comparisons when that
>> is possible and advantageous.  The comparisons to extract the
>> ordering vs just equality/nonequality are only on the first
>> nonmatching byte.
>
> But it's an overhead anyway.

Rather neglectable, IMHO.

> Then, it's bad enough for the inlining.

If it's inlined then the compiler should be smart enough to discard the
unneded bits.  If not, and the difference is measurable, then the compiler
should be fixed.

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux AG, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
