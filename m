From: Andreas Schwab <schwab@suse.de>
Subject: Re: Incorrect warning message?
Date: Sat, 15 Jan 2005 23:05:44 +0100
Message-ID: <jesm52pcuf.fsf@sykes.suse.de>
References: <20050116020836.A2421@natasha.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <gcc-return-108217-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050116020836.A2421@natasha.ward.six> (Denis Zaitsev's
 message of "Sun, 16 Jan 2005 02:08:36 +0500")
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: gcc@gcc.gnu.org
Cc: linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

> It's an example:
>
> void c(const char *s){}
> void cc(const char **p){}
> void x()
> {
>     char *s;
>     c(s);
>     cc(&s);
> }
>
> And it's the warning GCC produces for it:
>
> bug.c: In function `x':
> bug.c:7: warning: passing arg 1 of `cc' from incompatible pointer type
>
> Is this message correct?

Read question 11.10 of the C faq.

http://www.eskimo.com/~scs/C-faq/q11.10.html

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
