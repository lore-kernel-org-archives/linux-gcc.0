From: Gabriel Dos Reis <gdr@integrable-solutions.net>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: 05 Jan 2005 23:44:33 +0100
Message-ID: <m3ekgz8pim.fsf@uniton.integrable-solutions.net>
References: <20050105030102.G1437@natasha.ward.six>
	<20050104220523.GA24316@nevyn.them.org>
	<20050105031847.H1437@natasha.ward.six>
	<m3u0pwq13m.fsf@uniton.integrable-solutions.net>
	<20050105035915.I1437@natasha.ward.six>
	<m3hdlwpv5h.fsf@uniton.integrable-solutions.net>
	<20050106032545.L1437@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-107653-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050106032545.L1437@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

| > | Ok, but do we force users to use libm every time libc is used?
| > 
| > What is libc?  How do you define it?
| 
| I assume GLIBC, of course.  For x86, but I don't know either this
| matters.

That is a very narrow definition; however, are you claiming that the
mathematical functions are not part of GLIBC?

-- Gaby
