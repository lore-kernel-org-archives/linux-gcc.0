From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Thu, 6 Jan 2005 03:55:33 +0500
Message-ID: <20050106035533.N1437@natasha.ward.six>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <m3hdlwpv5h.fsf@uniton.integrable-solutions.net> <20050106032545.L1437@natasha.ward.six> <m3ekgz8pim.fsf@uniton.integrable-solutions.net>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m3ekgz8pim.fsf@uniton.integrable-solutions.net>; from gdr@integrable-solutions.net on Wed, Jan 05, 2005 at 11:44:33PM +0100
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gabriel Dos Reis <gdr@integrable-solutions.net>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Wed, Jan 05, 2005 at 11:44:33PM +0100, Gabriel Dos Reis wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> | > | Ok, but do we force users to use libm every time libc is used?
> | > 
> | > What is libc?  How do you define it?
> | 
> | I assume GLIBC, of course.  For x86, but I don't know either this
> | matters.
> 
> That is a very narrow definition; however, are you claiming that the
> mathematical functions are not part of GLIBC?

Of course no, I'm not.
