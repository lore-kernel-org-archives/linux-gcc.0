From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Tue, 21 Dec 2004 03:07:55 +0500
Message-ID: <20041221030755.C8330@natasha.ward.six>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu> <20041221024810.B8330@natasha.ward.six> <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <gcc-return-106899-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <A336BC32-52D1-11D9-9FB0-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Mon, Dec 20, 2004 at 04:53:52PM -0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>

On Mon, Dec 20, 2004 at 04:53:52PM -0500, Andrew Pinski wrote:

> The uses of the macros are not needed as shown by a "grep -r ."
> 
> Does this patch fix the problem for you?
> 
> Thanks,
> Andrew Pinski
> 

> Index: gc.c
> ===================================================================
> RCS file: /cvs/gcc/gcc/libobjc/gc.c,v
> retrieving revision 1.6
> diff -u -p -r1.6 gc.c
> --- gc.c	23 May 2003 20:04:58 -0000	1.6
> +++ gc.c	20 Dec 2004 21:51:20 -0000
> @@ -40,18 +40,6 @@ Boston, MA 02111-1307, USA.  */
>  typedef GC_word word;
>  typedef GC_signed_word signed_word;
>  
> -#if BITS_PER_WORD == 32
> -# define LOGWL	5
> -# define modWORDSZ(n) ((n) & 0x1f)        /* n mod size of word	    */
> -#endif
> -
> -#if BITS_PER_WORD == 64
> -# define LOGWL 6
> -# define modWORDSZ(n) ((n) & 0x3f)        /* n mod size of word	    */
> -#endif
> -
> -#define divWORDSZ(n) ((n) >> LOGWL)	   /* divide n by size of word      */
> -
>  #include <gc_typed.h>
>  
>  /* The following functions set up in `mask` the corresponding pointers.

The problem is not really here, but there:

line 316 of gc.c:

  size = ROUND (bits_no, BITS_PER_WORD) / BITS_PER_WORD;

So...  Why doesn't your grep show this?
