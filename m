From: Denis Zaitsev <zzz@anda.ru>
Subject: [PATCH] GCC 3.4.3: libobjc build failure
Date: Tue, 21 Dec 2004 02:35:48 +0500
Message-ID: <20041221023548.A8330@natasha.ward.six>
Mime-Version: 1.0
Return-path: <gcc-return-106890-gcc=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, linux-gcc@vger.kernel.org, gcc-patches@gcc.gnu.org
Cc: Zack Weinberg <zack@codesourcery.com>

This patch is for exactly the same issue as described in

http://gcc.gnu.org/ml/gcc/2002-12/msg00033.html

The fix is exactly the same, just another file is the target.  Without
it libobjc fails to build when --with-objc-gc is given to configure.

Please, apply it.


2004-12-21  Denis Zaitsev  <zzz@anda.ru>

	* libobjc/gc.c: Include coretypes.h and tm.h.


--- libobjc/gc.c.orig	2003-05-24 02:04:58.000000000 +0600
+++ libobjc/gc.c	2004-12-21 01:27:00.000000000 +0500
@@ -26,6 +26,8 @@ Boston, MA 02111-1307, USA.  */
    the executable file might be covered by the GNU General Public License.  */
 
 #include "tconfig.h"
+#include "coretypes.h"
+#include "tm.h"
 #include "objc.h"
 #include "encoding.h"
 
