From: Jesper Juhl <jesper.juhl@gmail.com>
Subject: Re: Reg. gcc
Date: Mon, 26 Sep 2005 20:51:20 +0200
Message-ID: <9a8748490509261151bb10b67@mail.gmail.com>
References: <Pine.LNX.4.61.0509270009110.14218@students.iiit.net>
Reply-To: Jesper Juhl <jesper.juhl@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0509270009110.14218@students.iiit.net>
Content-Disposition: inline
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasant Gopal <prasant_a@students.iiit.net>
Cc: linux-gcc@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/26/05, Prasant Gopal <prasant_a@students.iiit.net> wrote:
>
>
> hi ,
>
>            can i hav 2 versions of gcc installed on the same kernel..  If
> so how...please help me out...
>

If you have one, two, or more different versions of a userland program
(which gcc is) installed, is nothing the kernel cares about. This is a
userspace problem, not a kernel problem.

There is plenty of documentation to be found via google and other
sources that describe how to accomplish what you want to do - spend a
little time searching.

Here's one document that describes an installation of multiple gcc
versions (and there are lots of others out there) :
http://www.tellurian.com.au/whitepapers/multiplegcc.php

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
