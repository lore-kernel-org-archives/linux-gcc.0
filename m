From: Denis Zaitsev <zzz@anda.ru>
Subject: gcc-3.4.4-20050211: maybe a danger behaviour
Date: Sat, 26 Feb 2005 23:42:11 +0500
Message-ID: <20050226234210.A2223@macacos.ward.six>
Mime-Version: 1.0
Content-Disposition: inline
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org

Consider the following example:


enum w {
//    c=-1,
    a,
    b
};
whattodo (
    char option
) {
    static
    struct todo {
        enum w what;
        char option;
    } todos[]= {
        {a,'a'},
        {b,'b'},
        {-1}
    };
    struct todo *p= todos;
    do if (
        (option && !option)
    ) break;
    while ((++p)->what >= 0);
    return p->what;
}


Compiling with -O[>0] and -Wall for x86 we have that code for
whattodo:


whattodo:
.L2:
	jmp	.L2


a) Formally, the code is correct.  As p->what can never be < 0
according to its type.

b) GCC _silently_ allows the {-1} initialization for that type, even
with -Wall.

Uncommenting the c= -1 member of enum, or explicit casting p->what to
int solves the problem, of course.  But maybe some warning would be
appropriate in such a situation?  It takes some time for me to
recognize what leads me to that cool .L2: jmp .L2 from seemengly
harmless C code...  Or maybe I don't know some healthy compiler
option?
