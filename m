From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Thu, 6 Jan 2005 03:25:45 +0500
Message-ID: <20050106032545.L1437@natasha.ward.six>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <m3hdlwpv5h.fsf@uniton.integrable-solutions.net>
Mime-Version: 1.0
Return-path: <gcc-return-107647-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <m3hdlwpv5h.fsf@uniton.integrable-solutions.net>; from gdr@integrable-solutions.net on Wed, Jan 05, 2005 at 01:38:34AM +0100
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gabriel Dos Reis <gdr@integrable-solutions.net>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Wed, Jan 05, 2005 at 01:38:34AM +0100, Gabriel Dos Reis wrote:
> Denis Zaitsev <zzz@anda.ru> writes:
> 
> | On Tue, Jan 04, 2005 at 11:30:05PM +0100, Gabriel Dos Reis wrote:
> | > Denis Zaitsev <zzz@anda.ru> writes:
> | > | 
> | > |   a) why g++ assumes that libstdc++ is always needed?
> | > 
> | > Because that is the way it is designed.  If you don't want libstdc++,
> | > say -nostdlib as explained in our documentation.
> | 
> | This doesn't work out of the box...
> 
> If -nostdlib does not work as explained in the documentation, then you
> might have found a bug.  If you don't explain why it does not work as
> explained in the documentation or do not a fill a proper bug report,
> the probability that it gets fixed is near to zero.

It is not explained in the doc. in a much details.  So I don't know
either it is error or what.  In short, -nostdlib leads to the 'no std
objects' as well, and, as I understand, I must link them explicitly.
Or what does this mean:

/usr/bin/ld: warning: cannot find entry symbol _start; defaulting to 08048094

?

> | Ok, but do we force users to use libm every time libc is used?
> 
> What is libc?  How do you define it?

I assume GLIBC, of course.  For x86, but I don't know either this
matters.

> |  No, we
> | don't.  Of course, we don't.  And I emphasised the word 'always':
> | not _every_ routine from libstdc++ need libm, but it always
> | required...
> 
> The C++ standard library is a whole entity (minus the "freestanding"
> part) that is hard to split in meaningfully independent parts.
> Personnaly, I have zilk interest in splitting it into zillions
> arbitrary parts (or maintain such splits) and require users to supply
> zillions -lxxx switches. 
> 
> As a C++ user, when I say
> 
>    copy(istream_iterator<int>(cin), istream_iterator<int>(),
>         back_insert(v));
> 
> I have no idea of which of those zillions parts are involved
> underneath, I do not want to know, and a fortiori I do not want to
> be required to supply a cabalistic combination of switches to get it
> work. The compiler is better at that than I.

No, no, no...  The initial question has been asked having this in
mind: why the dependencies are used per-shared-object vs. per-module-inside-it?
As I understand now, it's impossible to have that per-module deps for
elf shared objects.  Ok, it's no a question more.

But then another question: if libstdc++ itself has libm in its NEEDED
list, why the whole app having libstdc++ in its NEEDED list is forced
(by the linker?) to have libm there too?  While the app itself never
really needs that libm?
