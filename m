From: Denis Zaitsev <zzz@anda.ru>
Subject: x86 D flag: what's its status thru the program?
Date: Sun, 4 Jul 2004 21:37:48 +0600
Sender: gcc-owner@gcc.gnu.org
Message-ID: <20040704213748.A796@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-98844-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org
Cc: linux-gcc@vger.kernel.org

Is this Direction flag (for the movs instructions) has some assumed
value (say, as after cld)?  I ask because the many program sources
show interesting behaviour: from one side, this flag is always set
before the string insns (cld or std), but from the other side, if the
programs does std then it always does cld after.  So, nobody leaves it
set, but nevertheless, everybody set it clear.  Why?
