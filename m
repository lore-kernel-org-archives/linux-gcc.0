From: Denis Zaitsev <zzz@anda.ru>
Subject: Why __memrchr vs. memrchr ?
Date: Tue, 3 Feb 2004 02:37:21 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20040203023721.A20354@zzz.ward.six>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14599-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

Why such a scheme is used in GLIBC:

declare + define __memrchr, and than

# ifdef __USE_GNU
#  define memrchr(s, c, n) __memrchr ((s), (c), (n))
# endif

?  memrchr is not the GNU extension, is it?

Thanks in advance.
