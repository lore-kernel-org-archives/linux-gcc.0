From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: i386 inline-asm string functions - some questions
Date: Mon, 29 Dec 2003 07:44:47 +0500
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <20031229074447.D6728@zzz.ward.six>
References: <20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com> <20031225064518.F7419@zzz.ward.six> <87d6acjlfp.fsf@egil.codesourcery.com> <20031227045815.GA14291@redhat.com> <87fzf6mubo.fsf@egil.codesourcery.com> <20031227163540.B6728@zzz.ward.six> <87brpum7gm.fsf@egil.codesourcery.com> <20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com>
Mime-Version: 1.0
Return-path: <libc-alpha-return-14205-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
Content-Disposition: inline
In-Reply-To: <871xqol5wv.fsf@codesourcery.com>; from zack@codesourcery.com on Sun, Dec 28, 2003 at 06:22:08PM -0800
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zack Weinberg <zack@codesourcery.com>
Cc: Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

On Sun, Dec 28, 2003 at 06:22:08PM -0800, Zack Weinberg wrote:
> 
> Meh.  I personally am convinced that the compiler can do a *much*
> better job, and that trying to improve bits/string.h and
> bits/string2.h is a waste of time; in fact, I've felt that they have
> *always* caused the generated code to get worse, from the day they
> were introduced.  I once tried to get Uli to take them out again,
> with hard numbers to back me up, but he ignored me.

Who is Uli - Ulrich Drepper?

> So I have very little interest in pursuing any of your suggestions.

But I don't even try to have you to do so!  I'm just trying to
understand what is/was happening.  I very don't like the content of
bits/string[2].h too.  And I don't want to offend you.  I'm very
sorry, if so.

> If you want to keep at them, though, and come up with patches, feel
> free.

Ok.
