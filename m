From: Ulrich Drepper <drepper@redhat.com>
Subject: Re: i386 inline-asm string functions - some questions
Date: Sun, 28 Dec 2003 19:35:49 -0800
Sender: gcc-owner@gcc.gnu.org
Message-ID: <3FEFA115.90704@redhat.com>
References: <20031225052045.A18774@zzz.ward.six>	<20031225003819.GC13447@redhat.com>	<20031225061524.E7419@zzz.ward.six> <87isk5lmk3.fsf@codesourcery.com>	<20031225064518.F7419@zzz.ward.six>	<87d6acjlfp.fsf@egil.codesourcery.com>	<20031227045815.GA14291@redhat.com>	<87fzf6mubo.fsf@egil.codesourcery.com>	<20031227163540.B6728@zzz.ward.six>	<87brpum7gm.fsf@egil.codesourcery.com>	<20031229015820.C6728@zzz.ward.six> <871xqol5wv.fsf@codesourcery.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-return-87961-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
In-Reply-To: <871xqol5wv.fsf@codesourcery.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Zack Weinberg <zack@codesourcery.com>
Cc: Richard Henderson <rth@redhat.com>, Andreas Jaeger <aj@suse.de>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org, gcc@gcc.gnu.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Zack Weinberg wrote:
> I once tried to get Uli to take them out again, with
> hard numbers to back me up, but he ignored me.

I have absolutely no problem taking out the inlines once gcc is able to
perform the same optimizations.  Problem is that nobody spent the time
so far to complete the task in gcc.  As far as I know each function we
still have has an advantage over the gcc code.

Just look at the inlines to determine what is optimized, do it in gcc,
and let me know.  Then I'll remove the inline.

- -- 
➧ Ulrich Drepper ➧ Red Hat, Inc. ➧ 444 Castro St ➧ Mountain View, CA ❖
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/76EV2ijCOnn/RHQRAiqSAJ94VislJ3isH5sUcxkVnYYPWf5P5wCgtG31
NshLBBxIoD9h39vlQ4cbjU8=
=kZHC
-----END PGP SIGNATURE-----
