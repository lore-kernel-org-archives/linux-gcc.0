From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: GCC 3.3.2 -Wall affects the code generated...
Date: Wed, 7 Jul 2004 04:46:04 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040707044604.C17650@natasha.ward.six>
References: <20040702000303.A797@natasha.ward.six> <40EB0E5E.4020002@specifixinc.com>
Mime-Version: 1.0
Return-path: <gcc-return-98941-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <40EB0E5E.4020002@specifixinc.com>; from wilson@specifixinc.com on Tue, Jul 06, 2004 at 01:41:02PM -0700
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Wilson <wilson@specifixinc.com>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Tue, Jul 06, 2004 at 01:41:02PM -0700, Jim Wilson wrote:
> Denis Zaitsev wrote:
> > header an inline function named strip is defined.  And I found that
> > the object code generated for this function depends of the presence of
> > -Wall in the list of option to GCC.  
> 
> This is probably a bug.  This is a small loop that is being complied 
> differently, so this might be a problem with a loop optimizer, or with 
> the basic block reorganizer.  I'd guess we have an uninitialized 
> variable, or some other kind of memory corruption somewhere.  I don't 
> know of any other reason why -Wall would effect the code emitted.
> 
> We need a testcase to look at this.  The source you provided can not be 
> compiled on its own.  I don't happen to have an x86 GLIBC tree, so I can 
> not easily generate my own testcase.  I tried fixing your testcase to 
> make it compilable, but nothing interesting happens when using 
> gcc-3.3.4.  I suspect that there is a complicated interaction going on 
> here, and we actually need the full input file to reproduce the problem, 
> rather than just the source for the one function that changes.  Or maybe 
> the problem has already been fixed.  I can't tell.

I used to assume that everybody has the GLIBC tree.  :)  So, I can
just sent all the necessary files to you.  And I don't think that this
problem is specific for that function, so there is no sence to try to
reproduce the problem upon that function only.  I have already told,
it seems that a compilation of that file loads GCC too high, and bugs
are popping up.  Compiling that file, GCC just refuse to do some
(other that the inlining) optimization it always does.  I can describe
this problem too, should it help.

And I going to compile and install GCC-3.3.4 myself, so I will try to
compile GLIBC with this GCC and will report the result.
