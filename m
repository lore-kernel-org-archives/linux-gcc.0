From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: Are string literals _always_ allocated in the RO section?
Date: Sun, 16 Jan 2005 02:41:26 +0500
Message-ID: <20050116024126.A3181@natasha.ward.six>
References: <20050116022247.A3066@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-108215-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <20050116022247.A3066@natasha.ward.six>; from zzz@anda.ru on Sun, Jan 16, 2005 at 02:22:48AM +0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

On Sun, Jan 16, 2005 at 02:22:48AM +0500, Denis Zaitsev wrote:
> the string "y" is put in the .text section.

Oh, it's put into the .rodata section.  A'm sorry.
