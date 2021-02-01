From: Amy Parker <enbyamy@gmail.com>
Subject: Alternative compilers to GCC/Clang
Date: Mon, 1 Feb 2021 15:31:49 -0800
Message-ID: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=HjmTKpGieoLOWt2p79tfhfP5UvMhYYaxr0kBRIrD13Q=;
        b=K+ImDEXqkmMRBskGOv3pPWfJcSPQAtGqus8kG/ijGsSOA4uISzMO3jFXwrp+tnThc3
         ihshD6gD3HVSr03nu4nZjv8q4AI3OequmxhAF2H7UMHoAIXHSlgMGH1nfhKJDzmRyiJv
         b0AUmohJeUaaKvEJcyBNcz7rxzwZ0AnDBiGMesolfTl9Hu/Yly1cKGZrXnYat8mDTpxX
         ZL6WGicLouPil7O1cMRihAOBpMubf/7QlCeZR7Ms3lTso4ktC1zAwOoQQV+axRXf20L+
         LXZZsB4xlGDrfDkz3sASrI1Fuz5V1oY4t3l0RNE6dBvdFsw2cfwJMcwDEFgAYrZ0s3US
         MdWA==
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello! My name's Amy. I'm really impressed by the work done to make
Clang (and the LLVM toolchain overall) able to compile the kernel.
Figured I might as well donate my monkey hours to helping make it run
on other compilers as well. I haven't been able to find any that use
the same arguments structure as GCC and Clang (read: you can pass it
in as CC=compilername in your $MAKEOPTS). Any compilers along that
route anyone here has worked with that I could work with?

Best regards,
Amy Parker
(she/her/hers)
