From: "Alexandre P. Nunes" <alexnunes@escriba.com.br>
Subject: Re: stat() problems.
Date: Thu, 01 Aug 2002 08:48:43 -0300
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <3D49201B.1090102@escriba.com.br>
References: <1028188562.1091.4.camel@skt.int.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc@vger.kernel.org

Stefanos Koutsoutos wrote:

>Hi,
>
>I'm facing problems with stat() system call. It seems that it follows
>filesystem links! To be more accurate I try:
>
>struct stat buf;
>stat("this_is_a_link", &buf);
>
>and then:	S_ISLNK( buf.st_mode )  is false!
>
>More, the mode is the same as the mode of the file it links to! I think
>that this is not what it supposed to be done by stat(). Any ideas??
>
>Thanks in advance.
>Stefanos.
>
>  
>

stat() follows symlinks. That's why there's lstat(), try it instead.

Cheers,

Alexandre


