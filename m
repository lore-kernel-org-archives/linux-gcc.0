From: Naga Raju <raj1234@gmail.com>
Subject: Shared libraries: How to share global variaables?
Date: Sat, 30 Oct 2004 10:51:28 +0530
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <e9ddb88e04102922215362c31b@mail.gmail.com>
References: <S263586AbUJ3FQs/20041030051648Z+543@vger.kernel.org>
	 <e9ddb88e04102922207ce4eb04@mail.gmail.com>
Reply-To: Naga Raju <raj1234@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <e9ddb88e04102922207ce4eb04@mail.gmail.com>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

Is it possible to share global variables such that all applications
which use shared libraries can see the changes made to the global
variables by the other applications.

I use gcc and compiled
      gcc -shared -Wl,-soname,xyz.so.1 -o libxyz.so.1.0 -lxyz2  abc.o

Regards,
Nagaraju.
