From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: timing
Date: Wed, 1 May 2002 19:20:30 +0100
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <15568.12782.509387.20577@cerise.nosuchdomain.co.uk>
References: <3CCFD6BA.1D667C11@cs.unt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <3CCFD6BA.1D667C11@cs.unt.edu>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mehran Rezaei <mehran@cs.unt.edu>
Cc: C news group <linux-c-programming@vger.kernel.org>, gcc news group <linux-gcc@vger.kernel.org>


Mehran Rezaei wrote:

> For the sake of performance analysis of some programs, I am using
> clock() function call. I am running the programs on a linux box (Redhat
> 7.2, and my machine is i686).
> However, I am not getting the correct results as I expected. Perhaps I
> miss something necessary for using timing function calls.

[snip]

> To my understanding both printfs should at least show 10 seconds
> (because of "sleep(10)"). But they do not.

clock() reports the amount of CPU time used by the program. sleep()
will use negligible CPU time (probably too small to measure).

-- 
Glynn Clements <glynn.clements@virgin.net>
