From: Roland McGrath <roland@redhat.com>
Subject: Re: strcmp is too heavy for its everyday usage...
Date: Wed, 7 Jan 2004 17:13:11 -0800
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <200401080113.i081DB1c000920@magilla.sf.frob.com>
References: <20040108060924.A4431@zzz.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-14350-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: Denis Zaitsev's message of  Thursday, 8 January 2004 06:09:24 +0500 <20040108060924.A4431@zzz.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Zaitsev <zzz@anda.ru>
Cc: Zack Weinberg <zack@codesourcery.com>, Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

The optimized string functions already do word comparisons when that is
possible and advantageous.  The comparisons to extract the ordering vs just
equality/nonequality are only on the first nonmatching byte.
