From: Denis Zaitsev <zzz@cd-club.ru>
Subject: glibc 2.3.1: fix for the i386 inline strings code
Date: Mon, 6 Jan 2003 06:30:48 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20030106063048.A32392@natasha.zzz.zzz>
Mime-Version: 1.0
Return-path: <libc-alpha-return-10887-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Drepper <drepper@redhat.com>, Andreas Jaeger <aj@suse.de>
Cc: libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

Nobody has answered to me for a while, so I'm resending this
politely...

This is a trivial patch for the inlined i386 strings' header.  Without
it, say, X11 can't be compiled with -D__USE_STRING_INLINES - a
problems will be caused by XtNewString and X11's own bzero.  These
problems are cured by the first and the second chunks of the patch,
correspondingly.

So, please, apply this.


--- sysdeps/i386/i486/bits/string.h.orig	Fri Jan  3 12:17:55 2003
+++ sysdeps/i386/i486/bits/string.h	Sat Jan  4 06:04:08 2003
@@ -40,10 +40,10 @@
 
 /* The macros are used in some of the optimized implementations below.  */
 #define __STRING_SMALL_GET16(src, idx) \
-  (((src)[idx + 1] << 8) | (src)[idx])
+  ((((char*)(src))[idx + 1] << 8) | ((char*)(src))[idx])
 #define __STRING_SMALL_GET32(src, idx) \
-  ((((src)[idx + 3] << 8 | (src)[idx + 2]) << 8				      \
-    | (src)[idx + 1]) << 8 | (src)[idx])
+  (((((char*)(src))[idx + 3] << 8 | ((char*)(src))[idx + 2]) << 8	      \
+    | ((char*)(src))[idx + 1]) << 8 | ((char*)(src))[idx])
 
 
 /* Copy N bytes of SRC to DEST.  */
@@ -229,7 +229,7 @@ memcmp (__const void *__s1, __const void
 	assignments using immediate operands.  But this uses to much	      \
 	memory (7, instead of 4 bytes).  So we force the value in a	      \
 	registers.  */							      \
-     if (n == 3 || n >= 5)						      \
+     if ((n) == 3 || (n) >= 5)						      \
        __asm__ __volatile__ ("" : "=r" (__c) : "0" (__c));		      \
 									      \
      /* This `switch' statement will be removed at compile-time.  */	      \
