From: Gabriel Dos Reis <gdr@integrable-solutions.net>
Subject: Re: Are string literals _always_ allocated in the RO section?
Date: 16 Jan 2005 00:18:20 +0100
Message-ID: <m3brbq1dtv.fsf@uniton.integrable-solutions.net>
References: <20050116022247.A3066@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-108222-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <20050116022247.A3066@natasha.ward.six>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Zaitsev <zzz@anda.ru>
Cc: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Denis Zaitsev <zzz@anda.ru> writes:

| This program:
| 
| void x(char *s)
| {
|     *s= 'x';
| }
| 
| main()
| {
|     x("y");
| }
| 
| is compiled plainly but cathes SIGSEGV in the 
| 
|         *s= 'x' 
| 
| line.  And it's because the string "y" is put in the .text section.
| And the fact that the x()'s parm is explicitly declared as <char*>,
| not <const char*> does nothing in this case.  Should it be considered
| as a bug?

In the program? Yes.

-- Gaby
