From: Jim Wilson <wilson@specifixinc.com>
Subject: Re: GCC 3.3.2 -Wall affects the code generated...
Date: Tue, 06 Jul 2004 13:41:02 -0700
Sender: gcc-owner@gcc.gnu.org
Message-ID: <40EB0E5E.4020002@specifixinc.com>
References: <20040702000303.A797@natasha.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-98932-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

Denis Zaitsev wrote:
> header an inline function named strip is defined.  And I found that
> the object code generated for this function depends of the presence of
> -Wall in the list of option to GCC.  

This is probably a bug.  This is a small loop that is being complied 
differently, so this might be a problem with a loop optimizer, or with 
the basic block reorganizer.  I'd guess we have an uninitialized 
variable, or some other kind of memory corruption somewhere.  I don't 
know of any other reason why -Wall would effect the code emitted.

We need a testcase to look at this.  The source you provided can not be 
compiled on its own.  I don't happen to have an x86 GLIBC tree, so I can 
not easily generate my own testcase.  I tried fixing your testcase to 
make it compilable, but nothing interesting happens when using 
gcc-3.3.4.  I suspect that there is a complicated interaction going on 
here, and we actually need the full input file to reproduce the problem, 
rather than just the source for the one function that changes.  Or maybe 
the problem has already been fixed.  I can't tell.
-- 
Jim Wilson, GNU Tools Support, http://www.SpecifixInc.com

