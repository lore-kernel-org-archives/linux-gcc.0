From: Prasant Gopal <prasant_a@students.iiit.net>
Subject: Reg. Multiple GCC 's
Date: Fri, 30 Sep 2005 22:07:21 +0530 (IST)
Message-ID: <Pine.LNX.4.61.0509302202010.10927@students.iiit.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463760860-751089758-1128098241=:10927"
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
To: linux-gcc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760860-751089758-1128098241=:10927
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable


   hi ,
   i am currently using gcc-4.0.0-8.   i wanted to hav gcc3.3 also.. So, i =

downloaded the gcc-3.3.tgz fr0m a mirror. i follwed the following steps..

           1. untar into my home directory.

           2. ./configure --prefix=3D/usr/local/gcc/3.3

           3. make bootstrap

    & got the following error...


     ./read-rtl.c: In function =E2=80=98read_rtx=E2=80=99:
     ./read-rtl.c:653: error: invalid lvalue in increment
     make[2]: *** [read-rtl.o] Error 1
     make[2]: Leaving directory `/home/prasant/gcc-3.3/gcc'
     make[1]: *** [stage1_build] Error 2
     make[1]: Leaving directory `/home/prasant/gcc-3.3/gcc'
     make: *** [bootstrap] Error 2



    Please _help_ me out...

regards ,
prasant


--=20
---------------------------------------------------------------------------=
-----------------------------------------------------------------


   Only wimps use tape backup :  _real_men just upload their important
   stuff on ftp and let the rest of the world mirror it

                                        -- Linus Torvalds
---1463760860-751089758-1128098241=:10927--
