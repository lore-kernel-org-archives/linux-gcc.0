From: James Antill <james@and.org>
Subject: Re: strcmp is too heavy for its everyday usage...
Date: Wed, 14 Jan 2004 00:09:18 -0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <m3vfnfxgjl.fsf@code.and.org>
References: <20040108060924.A4431@zzz.ward.six>
	<200401080113.i081DB1c000920@magilla.sf.frob.com>
	<20040108063636.C11508@zzz.ward.six> <jeoetehjoj.fsf@sykes.suse.de>
	<20040109101145.A8801@zzz.ward.six>
	<20040109081231.GA4218@twiddle.net>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14450-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20040109081231.GA4218@twiddle.net> (Richard Henderson's
 message of "Fri, 9 Jan 2004 00:12:31 -0800")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org
Cc: libc-alpha@sources.redhat.com

Richard Henderson <rth@twiddle.net> writes:

> On Fri, Jan 09, 2004 at 10:11:45AM +0500, Denis Zaitsev wrote:
>>     (r= a[0] - b[0]) &&
>>     (r= a[1] - b[1]) &&
>>     (r= a[2] - b[2]) &&
>>     (r= a[3] - b[3]);
>>     return r;
>> }
>>
>> never do that, as it's not asked to.  Or this kind of optimization is
>> assumed ok for compiler, but just still unimplemented?
>
> Certainly it's ok if it converts.
>
> However, on most targets you'd have to know that a and b are aligned.
> Worse, even for targets like x86 that support unaligned loads you have
> to know for certain that neither a[3] nor b[3] could possibly segv
> when a[0] and b[0] won't.  That condition is trivial when a and b are
> aligned, but otherwise...

 Fair enough, but...

extern int
s(const unsigned char a[static 4], const unsigned char b[static 4])
{
    int r;
    (r= a[0] - b[0]) &&
    (r= a[1] - b[1]) &&
    (r= a[2] - b[2]) &&
    (r= a[3] - b[3]);
    return r;
}

...produces the same code.

-- 
# James Antill -- james@and.org
:0:
* ^From: .*james@and\.org
/dev/null
