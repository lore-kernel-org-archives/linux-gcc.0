From: Jim Wilson <wilson@specifixinc.com>
Subject: Re: x86 D flag: what's its status thru the program?
Date: Tue, 06 Jul 2004 17:32:32 -0700
Sender: gcc-owner@gcc.gnu.org
Message-ID: <40EB44A0.3000407@specifixinc.com>
References: <20040704213748.A796@natasha.ward.six> <Pine.GSO.4.58.0407051519010.27449@mion.elka.pw.edu.pl> <20040705222647.A17650@natasha.ward.six> <Pine.GSO.4.58.0407051912010.9712@mion.elka.pw.edu.pl> <20040706010404.B17650@natasha.ward.six>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <gcc-return-98953-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Denis Zaitsev wrote:
>=20
> Ok.  Thanks!  It's the thing that I didn't understand.  BTW, where is
> this convention documented, if either?

The Linux Standard Base is a good source of info like this.  See
http://www.linuxbase.org/spec/refspecs/LSB_1.3.0/IA32/spec/rstandards.html#=
AEN34
Look at the one titled "System V Application Binary Interface -=20
Intel386=99 Architecture Processor Supplement, Fourth Edition".
http://www.caldera.com/developers/devspecs/abi386-4.pdf
Then search for EFLAGS in that document.
--=20
Jim Wilson, GNU Tools Support, http://www.SpecifixInc.com

