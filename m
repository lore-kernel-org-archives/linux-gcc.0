From: Richard Henderson <rth@redhat.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Fri, 26 Dec 2003 20:58:15 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20031227045815.GA14291@redhat.com>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com> <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com>
Mime-Version: 1.0
Return-path: <gcc-return-87933-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <87d6acjlfp.fsf@egil.codesourcery.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Thu, Dec 25, 2003 at 07:40:42PM -0800, Zack Weinberg wrote:
> For a starter, try changing "m" and see how far you get.

That would definitely be wrong when the operand is actually used.


r~
