From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: build
Date: Thu, 6 May 2004 15:55:09 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20040506135508.GC31514@MAIL.13thfloor.at>
References: <018401c432a8$bc7fc080$630210ac@dominc>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <018401c432a8$bc7fc080$630210ac@dominc>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominic VP <dominic.vp@globaledgesoft.com>
Cc: linux-gcc@vger.kernel.org

On Wed, May 05, 2004 at 07:26:17PM +0530, Dominic VP wrote:
> Hi,
> 
> I am having to port linux to a new architecture. This architecture does not
> have gcc ported on to it. This does have an ansi c compiler/as/ld.
> 
> Has anyone has had any experience/success with building linux with an ansi c
> compiler. I know it does not build automagically, but any info on
> deviations/changes/tools would be appreciated a LOT.

to compile the linux kernel only a 'simple' gcc/binutil
version is required ... so the best thing would be to
port just the required parts of gcc/binutils

see here for some details:
http://vserver.13thfloor.at/Stuff/Cross/howto.info

(make sure to compile and install the binutils first)

HTH,
Herbert

PS: I doubt that an ansi compiler (probably not even
    C99) will be able to compile linux kernels ...
PPS: please let me know if you succeed ...
    
> thanks in advance,
> dominique
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
