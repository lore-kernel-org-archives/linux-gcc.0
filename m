From: Dale Johannesen <dalej@apple.com>
Subject: Re: Are string literals _always_ allocated in the RO section?
Date: Sat, 15 Jan 2005 13:27:46 -0800
Message-ID: <4C70E799-673C-11D9-9F23-000A95D7D16C@apple.com>
References: <20050116022247.A3066@natasha.ward.six>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-108214-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050116022247.A3066@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, Dale Johannesen <dalej@apple.com>


On Jan 15, 2005, at 1:22 PM, Denis Zaitsev wrote:

> This program:
>
> void x(char *s)
> {
>     *s= 'x';
> }
>
> main()
> {
>     x("y");
> }
>
> is compiled plainly but cathes SIGSEGV in the
>
>         *s= 'x'
>
> line.

That's what's supposed to happen.  Storing into a string
constant is invalid C.

