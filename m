From: Denis Zaitsev <zzz@anda.ru>
Subject: Re: [i386] Why g++ _always_ link an executable with libm.so?
Date: Wed, 5 Jan 2005 04:16:06 +0500
Message-ID: <20050105041606.J1437@natasha.ward.six>
References: <20050105030102.G1437@natasha.ward.six> <20050104220523.GA24316@nevyn.them.org> <20050105031847.H1437@natasha.ward.six> <m3u0pwq13m.fsf@uniton.integrable-solutions.net> <20050105035915.I1437@natasha.ward.six> <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>
Mime-Version: 1.0
Return-path: <gcc-return-107570-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
In-Reply-To: <51D8FCE4-5EA5-11D9-9A04-000A95D692F4@physics.uc.edu>; from pinskia@physics.uc.edu on Tue, Jan 04, 2005 at 06:06:51PM -0500
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Pinski <pinskia@physics.uc.edu>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, Gabriel Dos Reis <gdr@integrable-solutions.net>

On Tue, Jan 04, 2005 at 06:06:51PM -0500, Andrew Pinski wrote:
> 
> On Jan 4, 2005, at 5:59 PM, Denis Zaitsev wrote:
> 
> > Ok, but do we force users to use libm every time libc is used?  No, we
> > don't.  Of course, we don't.  And I emphasised the word 'always':
> > not _every_ routine from libstdc++ need libm, but it always
> > required...
> 
> Then write a better collect2 which only links in the libraries which
> are needed and have it find the needed libraries without supplying
> the option to link the library (yes this is on the TODO page of gcc).
> 
> Also note on some targets like darwin, libm is included in libsystem 
> (aka
> libc) by default.

Ok, I'm not trying to criticize the way it implemented for now.  I'm
trying to understand what happens now.
