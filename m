From: Denis Zaitsev <zzz@anda.ru>
Subject: strcmp is too heavy for its everyday usage...
Date: Thu, 8 Jan 2004 06:09:24 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040108060924.A4431@zzz.ward.six>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14349-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>, Andreas Jaeger <aj@suse.de>, Richard Henderson <rth@redhat.com>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

strcmp is _mostly_ used here and there to check strings for equality
only, not for finding their ordering.  And if we have a function for
this equality check only, it would be a reasonable benefit:

a) for a long strings this function can operate with a whole
   words vs. bytes, which is much faster;

b) for a very short strings, when strcmp and this function can be
   unrolled into a series of a direct bytes comparing, this defun
   don't have to cope with (unsigned char) -> (int) casting for the
   each pair of bytes, so it will be shorter, faster etc.

memcmp is the subject of the question, too.

Any comments?
