From: "J." <mailing-lists@xs4all.nl>
Subject: Re: Detecting running deamons
Date: Fri, 28 Mar 2003 20:18:37 +0100 (CET)
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303282017530.12680-100000@hestia>
References: <007801c2f54c$a5becde0$0b00a8c0@SPLUCIANO>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <007801c2f54c$a5becde0$0b00a8c0@SPLUCIANO>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org

On Fri, 28 Mar 2003, Luciano Moreira - igLnx wrote:

> I have a application that run like a deamon, which write in a file its PID,
> that is used to stop it later by others programs. But, I ve noted that my
> users send signal 9 to stop deamons, and my application cannot remove its
> PID file, because it cannot handle singal 9, keeping its PID file at HD
> (FileSystem).
> 
> Can someone sugest me a way to know the deamon's PID, without write it to a
> file ?
> OR
> How can I do to know if my deamon is running and get its PID ?
> 
On the command-line:
 pidof `which program_name`
or:
 ps aux | grep program_name
or perhaps interactive?:
 top

> Thanks,

No problemo

> Luciano

J.

