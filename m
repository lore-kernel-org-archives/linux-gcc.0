From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [PATCH] GCC 3.4.3: libobjc build failure
Date: Tue, 21 Dec 2004 02:48:11 +0500
Message-ID: <20041221024810.B8330@natasha.ward.six>
References: <20041221023548.A8330@natasha.ward.six> <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <gcc-return-106894-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <81947436-52CF-11D9-9FB0-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Mon, Dec 20, 2004 at 04:38:36PM -0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, gcc-patches@gcc.gnu.org, Zack Weinberg <zack@codesourcery.com>

On Mon, Dec 20, 2004 at 04:38:36PM -0500, Andrew Pinski wrote:
> 
> On Dec 20, 2004, at 4:35 PM, Denis Zaitsev wrote:
> 
> > This patch is for exactly the same issue as described in
> >
> > http://gcc.gnu.org/ml/gcc/2002-12/msg00033.html
> >
> > The fix is exactly the same, just another file is the target.  Without
> > it libobjc fails to build when --with-objc-gc is given to configure.
> 
> This patch is incorrect as noted before.  I am going to reject it
> as it was rejected before.  Again libobjc has no reason to include
> these headers.

a) The patches from the reference I've noted are already applied.

b) libobjc is not compiled without the new patch.  How should it be
   fixed then?
