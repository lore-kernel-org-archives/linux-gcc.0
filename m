From: "Arun Kumar" <arun.kumar@bhartitelesoft.com>
Subject: Linking error on Linux platform
Date: Tue, 13 Sep 2005 14:32:55 +0530
Message-ID: <EKEBKBBDOANDBLFDCHONEEKMCBAA.arun.kumar@bhartitelesoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

Hi

We are trying to build a solution on Linux machine but we are getting
folliwng error while linking. Could you please suggest any solution. Are we
missing any specific flag pertaining to LINUX?


make[1]: Leaving directory `/home/stack/SCU_UGANDA/SRC/LCL/tdftha/tdftha_c'
gcc -L../../iu/SCU/LIB/hss -L../../iu/SCU/LIB/scu -u sgCfnEncode -u
sgCfnDecode ./td_sys.o                                     ./libry_td.a
./libsg_td.a ./libiu_td.a ./libmt_td.a
./libcm_td.a -lnsl -lpthread -lmp_userif -lisc -lissh -lhsstotrill -ltrillto
hss  -L/usr/bin/gcc -o scu_lcl
/usr/bin/ld: relocation error: /usr/bin/ld: undefined symbol:
xmalloc_set_program_name
collect2: ld returned 127 exit status
make: *** [scu_lcl] Error 1


Regards,
Arun Kumar

