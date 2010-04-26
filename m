From: Dominic <dominicwj@gmail.com>
Subject: Re: Ask help:what does entry-point address mean in a ELF-64 file?
Date: Mon, 26 Apr 2010 20:02:40 +0800
Message-ID: <k2hdf5e30c51004260502p69161a3fme3c9d77b99445fdc@mail.gmail.com>
References: <v2qdf5e30c51004221548l69c31d0cx31c9971d1e56f170@mail.gmail.com>
	 <4BD1250C.9060308@ispras.ru>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=9HQmytiXKWYNXHj/OQ7+M6IvvjadgfoZebLwgUv0ZSM=;
        b=vJCTWkUzZCcLN8XIA4hHUB+J4D227nlBPgmNZqHhhiwzmpcN4srM9rmLQYTmBLNPze
         3tywO3byYjUilinGpaRKYjazDP7w+GQ7RdQ/qzNdg8GNPf9yygxfovBbTczmDshZaxrI
         QKblyJhuh7IgwKzNxGaKidwHFXldJX/lDc75k=
In-Reply-To: <4BD1250C.9060308@ispras.ru>
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Ponomarenko <susanin@ispras.ru>
Cc: linux-gcc@vger.kernel.org

Hi Andrey,

Thanks a lot, it is a nice article, thanks!

On Fri, Apr 23, 2010 at 12:41 PM, Andrey Ponomarenko <susanin@ispras.ru> wrote:
> Hello,
>
> I suppose this article gives a shallow explanation for your problem.
>
> On 04/23/2010 02:48 AM, Jian Wang wrote:
>
> Hi,
> I am trying to understand the ELF file, I use readelf utility to read
> an ELF file, in the result, there is entry-point address displayed. I
> searched on the Internet, it says its a virtual address. My question
> is could two program have the same entry-point address(if I compile
> hello1.c,then compile another hello2.c)? How does the loader map this
> virtual address to the physical address?
> Thanks a lot for any comments!!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> --
> Andrey Ponomarenko
> Linux Verification Center, ISPRAS
>  web:    http://www.linuxtesting.org
