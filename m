From: David Mosberger <davidm@napali.hpl.hp.com>
Subject: Re: Kernel Cross Compiling
Date: Fri, 13 Feb 2004 13:31:28 -0800
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <16429.16944.521739.223708@napali.hpl.hp.com>
References: <20040213205743.GA30245@MAIL.13thfloor.at>
Reply-To: davidm@hpl.hp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20040213205743.GA30245@MAIL.13thfloor.at>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Herbert Poetzl <herbert@13thfloor.at>
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org

>>>>> On Fri, 13 Feb 2004 21:57:43 +0100, Herbert Poetzl <herbert@13thfloor.at> said:

  Herbert> I got all headers fixed, except for the ia64, which still
  Herbert> doesn't work

Something sounds wrong here. You shouldn't have to patch headers.

A recipe for building ia32->ia64 cross-toolchain on Debian can be
found here:

 http://www.gelato.unsw.edu.au/IA64wiki/CrossCompilation

	--david
