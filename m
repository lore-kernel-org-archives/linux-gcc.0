From: Gabriel Dos Reis <gdr@integrable-solutions.net>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: 05 Jan 2005 01:38:34 +0100
Message-ID: <m3hdlwpv5h.fsf@uniton.integrable-solutions.net>
References: <20050105030102.G1437@natasha.ward.six>
	<20050104220523.GA24316@nevyn.them.org>
	<20050105031847.H1437@natasha.ward.six>
	<m3u0pwq13m.fsf@uniton.integrable-solutions.net>
	<20050105035915.I1437@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107576-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050105035915.I1437@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

| On Tue, Jan 04, 2005 at 11:30:05PM +0100, Gabriel Dos Reis wrote:
| > Denis Zaitsev <zzz@anda.ru> writes:
| > | 
| > |   a) why g++ assumes that libstdc++ is always needed?
| > 
| > Because that is the way it is designed.  If you don't want libstdc++,
| > say -nostdlib as explained in our documentation.
| 
| This doesn't work out of the box...

If -nostdlib does not work as explained in the documentation, then you
might have found a bug.  If you don't explain why it does not work as
explained in the documentation or do not a fill a proper bug report,
the probability that it gets fixed is near to zero.

| But yes, it can be a solution,  thanks.
| 
| > |   b) why is libm _always_ needed by libstdc++?
| > 
| > Because libstdc++ needs the mathematical functions.
| > 
| > |  It's rather strange.
| > 
| > I guess it is a matter of perspective.  From my part, requiring users
| > to explicitly supply -lm is a bug.  Simply because the mathematical
| > functions are part of the standard library; we do not require users to
| > say -lstr when they use strcpy() and friend; we do not require users
| > to say -lstdio when they use fprintf() and friends.  YMMV.
| 
| Ok, but do we force users to use libm every time libc is used?

What is libc?  How do you define it?

|  No, we
| don't.  Of course, we don't.  And I emphasised the word 'always':
| not _every_ routine from libstdc++ need libm, but it always
| required...

The C++ standard library is a whole entity (minus the "freestanding"
part) that is hard to split in meaningfully independent parts.
Personnaly, I have zilk interest in splitting it into zillions
arbitrary parts (or maintain such splits) and require users to supply
zillions -lxxx switches. 

As a C++ user, when I say

   copy(istream_iterator<int>(cin), istream_iterator<int>(),
        back_insert(v));

I have no idea of which of those zillions parts are involved
underneath, I do not want to know, and a fortiori I do not want to
be required to supply a cabalistic combination of switches to get it
work. The compiler is better at that than I.

-- Gaby
