From: Andrew Pinski <pinskia@physics.uc.edu>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Mon, 20 Dec 2004 16:53:52 -0500
Message-ID: <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221024810.B8330@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Type: multipart/mixed; boundary=Apple-Mail-25-718380879
Return-path: <gcc-patches-return-136780-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-patches-unsubscribe-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
List-Post: <mailto:gcc-patches@gcc.gnu.org>
List-Help: <mailto:gcc-patches-help@gcc.gnu.org>
Sender: gcc-patches-owner@gcc.gnu.org
In-Reply-To: <20041221024810.B8330@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>


--Apple-Mail-25-718380879
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed


On Dec 20, 2004, at 4:48 PM, Denis Zaitsev wrote:

> On Mon, Dec 20, 2004 at 04:38:36PM -0500, Andrew Pinski wrote:
>>
>> On Dec 20, 2004, at 4:35 PM, Denis Zaitsev wrote:
>>
>>> This patch is for exactly the same issue as described in
>>>
>>> http://gcc.gnu.org/ml/gcc/2002-12/msg00033.html
>>>
>>> The fix is exactly the same, just another file is the target.  
>>> Without
>>> it libobjc fails to build when --with-objc-gc is given to configure.
>>
>> This patch is incorrect as noted before.  I am going to reject it
>> as it was rejected before.  Again libobjc has no reason to include
>> these headers.
>
> a) The patches from the reference I've noted are already applied.
Yes and the patch was submitted before, see
<http://gcc.gnu.org/bugzilla/show_bug.cgi?id=12035>.


> b) libobjc is not compiled without the new patch.  How should it be
>    fixed then?

The uses of the macros are not needed as shown by a "grep -r ."

Does this patch fix the problem for you?

Thanks,
Andrew Pinski


--Apple-Mail-25-718380879
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
+++ gc.c	20 Dec 2004 21:51:20 -0000
@@ -40,18 +40,6 @@ Boston, MA 02111-1307, USA.  */
 typedef GC_word word;
 typedef GC_signed_word signed_word;
 
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
-
 #include <gc_typed.h>
 
 /* The following functions set up in `mask` the corresponding pointers.

--Apple-Mail-25-718380879--

