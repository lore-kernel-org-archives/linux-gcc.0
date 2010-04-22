From: Jian Wang <dominicwj@gmail.com>
Subject: Ask help:what does entry-point address mean in a ELF-64 file?
Date: Fri, 23 Apr 2010 06:48:36 +0800
Message-ID: <v2qdf5e30c51004221548l69c31d0cx31c9971d1e56f170@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=mwBrSH3VnuknSyk04y7BzB/CKZVr3QemQcEOT/MeEYg=;
        b=IhUh04su+NLnA1xJfOszqZeTnW4AnW1MlfCMf6/LmDOeH9d6G12mMKPHQozulFAxZS
         2KNb+Z7O4NbhfW1JHp/sfREuSlzrf/qbCc1raWocjRLygOQU65D2qSPbdt2Y3liG2YTU
         McEZXwsIRtEV0aJBfcr96PALHpyhtynsj+pwU=
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org

Hi,

I am trying to understand the ELF file, I use readelf utility to read
an ELF file, in the result, there is entry-point address displayed. I
searched on the Internet, it says its a virtual address. My question
is could two program have the same entry-point address(if I compile
hello1.c,then compile another hello2.c)? How does the loader map this
virtual address to the physical address?

Thanks a lot for any comments!!
