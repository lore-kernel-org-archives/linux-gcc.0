From: "Zack Weinberg" <zack@codesourcery.com>
Subject: Re: GCC 3.3.2: Some bug in the preprocessor?
Date: Thu, 12 Feb 2004 12:34:04 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <878yj8qbpf.fsf@egil.codesourcery.com>
References: <20040213012958.A14323@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-91205-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <20040213012958.A14323@zzz.ward.six> (Denis Zaitsev's message
 of "Fri, 13 Feb 2004 01:29:58 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org
Cc: linux-gcc@vger.kernel.org


You cannot use casts in #if.  Your conditionals are read as

#if (0)0 > -1

which produces a syntax error;

#if 0 > (0)-1

which evaluates as 0 > 0 - 1 which is true.

zw
