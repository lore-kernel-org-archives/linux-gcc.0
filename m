From: Richard Henderson <rth@redhat.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Wed, 24 Dec 2003 17:53:53 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20031225015353.GE13447@redhat.com>
References: <20031225052045.A18774@zzz.ward.six> <20031225003819.GC13447@redhat.com> <20031225060850.C7419@zzz.ward.six> <20031225012711.GD13447@redhat.com> <20031225063850.A7869@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-87923-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
In-Reply-To: <20031225063850.A7869@zzz.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Thu, Dec 25, 2003 at 06:38:50AM +0500, Denis Zaitsev wrote:
> Ok.  BTW, I was looking around a little - and it seems that "m" suits
> better here than "X" - we deals with a memory operand, not with "Any
> operand whatsoever" (according to the documentation).  But you suggest
> "X" (and this is not the first time).  Why?

Because "m" implies (1) that the address must be valid and
(2) that the address is used.


r~
