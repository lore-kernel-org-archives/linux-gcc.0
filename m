From: Denis Zaitsev <zzz@anda.ru>
Subject: Are string literals _always_ allocated in the RO section?
Date: Sun, 16 Jan 2005 02:22:48 +0500
Message-ID: <20050116022247.A3066@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-108212-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

This program:

void x(char *s)
{
    *s= 'x';
}

main()
{
    x("y");
}

is compiled plainly but cathes SIGSEGV in the 

        *s= 'x' 

line.  And it's because the string "y" is put in the .text section.
And the fact that the x()'s parm is explicitly declared as <char*>,
not <const char*> does nothing in this case.  Should it be considered
as a bug?
