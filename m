From: Denis Zaitsev <zzz@anda.ru>
Subject: GCC 3.3.2: Some bug in the preprocessor?
Date: Fri, 13 Feb 2004 01:29:58 +0500
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040213012958.A14323@zzz.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-91204-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Look, this defun returns 0, and this is correct:

tst()
{
#if (unsigned)0 > -1
    return 1;
#else
    return 0;
#endif
}

But this one returns 1, and this is incorrect:

tst()
{
#if 0 > (unsigned)-1
    return 1;
#else
    return 0;
#endif
}

What's wrong?
