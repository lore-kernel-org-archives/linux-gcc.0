From: "Luciano Moreira - igLnx" <lucianolnx@ig.com.br>
Subject: Detecting running deamons
Date: Fri, 28 Mar 2003 14:08:22 -0300
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <007801c2f54c$a5becde0$0b00a8c0@SPLUCIANO>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

I have a application that run like a deamon, which write in a file its PID,
that is used to stop it later by others programs. But, I ve noted that my
users send signal 9 to stop deamons, and my application cannot remove its
PID file, because it cannot handle singal 9, keeping its PID file at HD
(FileSystem).

Can someone sugest me a way to know the deamon's PID, without write it to a
file ?
OR
How can I do to know if my deamon is running and get its PID ?

Thanks,

Luciano


