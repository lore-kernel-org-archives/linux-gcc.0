From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: GCC 3.3.2: Some bug in the preprocessor?
Date: Fri, 13 Feb 2004 01:44:07 +0500
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040213014407.B14323@zzz.ward.six>
References: <20040213012958.A14323@zzz.ward.six> <878yj8qbpf.fsf@egil.codesourcery.com>
Mime-Version: 1.0
Return-path: <gcc-return-91208-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <878yj8qbpf.fsf@egil.codesourcery.com>; from zack@codesourcery.com on Thu, Feb 12, 2004 at 12:34:04PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Thu, Feb 12, 2004 at 12:34:04PM -0800, Zack Weinberg wrote:
> 
> You cannot use casts in #if.  Your conditionals are read as
> 
> #if (0)0 > -1
> 
> which produces a syntax error;

Oh, ok, thanks.  I've missed the error message...
