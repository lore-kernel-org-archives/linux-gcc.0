From: David Hollister <dhollister@igca.com>
Subject: Problems with "cross" development linking
Date: Fri, 19 Apr 2002 09:22:50 -0700
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3CC0445A.7080309@igca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc@vger.kernel.org

Hello,

I have a development environment where I'd like to be able to use all 
libraries from a specified directory when compiling and linking.  Both 
the host and the "target" are x86, so I didn't build the "target" gcc 
as a cross-compiler.  In the past, our development machines always ran 
the same release as our target.  I'd like, however, to remove that 
restriction for the future.  What I've done seems to work fine if the 
"host" has the same or newer glibc as the "target", but I found that 
if the reverse is true, my setup breaks.

I am able to get all the proper executables called and the library 
paths set with the appropriate environment variables.  However, when I 
compile, this is what I see (in this example, the host is RedHat 6.2 
and the target is RedHat 7.2-based)

/space/target/bin/as: /lib/libc.so.6: version `GLIBC_2.2.3' not found 
(required by /space/target/bin/as)

I even tried the following:

LD_LIBRARY_PATH=/space/target/lib /space/target/lib/ld-linux.so.2 
/space/target/bin/gcc ...

Everything now appears to come from the right place (/space/target) 
except for "ld-linux.so.2".  In that case, I saw:

/space/target/lib/gcc-lib/i486-redhat-linux/2.96/cpp0: 
/lib/ld-linux.so.2: version `GLIBC_2.2.3' not found (required by 
/space/target/lib/libc.so.6)
/space/target/lib/gcc-lib/i486-redhat-linux/2.96/cpp0: 
/lib/ld-linux.so.2: version `GLIBC_2.2' not found (required by 
/space/target/lib/libc.so.6)

 From what I've seen on numerous searches all over the net, it would 
seem that /lib/ld-linux.so.? is hard-coded.  Is that true?  Is there 
any way to get the binaries in my target to look for ld-linux.so.2 
from the target directory?  Am I even in the right ballpark on how to 
attack this?

I hope I've described the situation well enough.  Any suggestions or 
help would be greatly appreciated.

Thanks.

-- 
David Hollister
Sr. Software Engineer
Innovative Gaming Corporation of America

