From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Mon, 20 Dec 2004 17:03:45 -0500
Message-ID: <047968C8-52D3-11D9-9FB0-000A95D692F4@physics.uc.edu>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221024810.B8330@natasha.ward.six> <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Type: multipart/mixed; boundary=Apple-Mail-26-718973552
Return-path: <gcc-return-106898-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu>
List-Id: <linux-gcc.vger.kernel.org>
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org, Denis Zaitsev <zzz@anda.ru>, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>


--Apple-Mail-26-718973552
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed


On Dec 20, 2004, at 4:53 PM, Andrew Pinski wrote:
>
>> b) libobjc is not compiled without the new patch.  How should it be
>>    fixed then?
>
> The uses of the macros are not needed as shown by a "grep -r ."
>
> Does this patch fix the problem for you?

Actually that patch will not work, sorry about that.

This one is better and should work.


If it does not report the errors please as it will help to fix the
problem.

Thanks,
Andrew Pinski


--Apple-Mail-26-718973552
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	x-unix-mode=0644;
	name="temp1.diff.txt"
Content-Disposition: attachment;
	filename=temp1.diff.txt

Index: gc.c
===================================================================
RCS file: /cvs/gcc/gcc/libobjc/gc.c,v
retrieving revision 1.6
diff -u -p -r1.6 gc.c
--- gc.c	23 May 2003 20:04:58 -0000	1.6
+++ gc.c	20 Dec 2004 22:01:27 -0000
@@ -35,22 +35,12 @@ Boston, MA 02111-1307, USA.  */
 #if OBJC_WITH_GC
 
 #include <gc.h>
+#include <limits.h>
 
 /* gc_typed.h uses the following but doesn't declare them */
 typedef GC_word word;
 typedef GC_signed_word signed_word;
-
-#if BITS_PER_WORD == 32
-# define LOGWL	5
-# define modWORDSZ(n) ((n) & 0x1f)        /* n mod size of word	    */
-#endif
-
-#if BITS_PER_WORD == 64
-# define LOGWL 6
-# define modWORDSZ(n) ((n) & 0x3f)        /* n mod size of word	    */
-#endif
-
-#define divWORDSZ(n) ((n) >> LOGWL)	   /* divide n by size of word      */
+#define BITS_PER_WORD (CHAR_BIT * sizeof (word))
 
 #include <gc_typed.h>
 

--Apple-Mail-26-718973552--

