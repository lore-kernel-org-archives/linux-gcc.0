From: Stefanos Koutsoutos <koutsoutos@md5sa.com>
Subject: Re: stat() problems.
Date: 01 Aug 2002 15:05:23 +0300
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <1028203524.1091.8.camel@skt.int.local>
References: <1028188562.1091.4.camel@skt.int.local> 
	<3D49201B.1090102@escriba.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <3D49201B.1090102@escriba.com.br>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

Thanks a lot Alexandre!


On Thu, 2002-08-01 at 14:48, Alexandre P. Nunes wrote:
>
> stat() follows symlinks. That's why there's lstat(), try it instead.
> 
> Cheers,
> 
> 

-- 
____________________
Stefanos Koutsoutos
Developer
MD5 S.A.
koutsoutos@md5sa.com
www.md5sa.com

