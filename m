From: Dave Jones <davej@redhat.com>
Subject: Re: BUG: 2.6.0 non fatal recoverable errors crash gcc
Date: Fri, 2 Jan 2004 00:52:24 +0000
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20040102005224.GA18361@redhat.com>
References: <3FF4B3E7.9050309@zwanebloem.nl>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3FF4B3E7.9050309@zwanebloem.nl>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tommy Faasen <tommy@zwanebloem.nl>
Cc: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org

On Fri, Jan 02, 2004 at 12:57:27AM +0100, Tommy Faasen wrote:

 > I'm not subscribed to this newsgroup, but i'll try to read the follow-up 
 > messages if any.
 > 
 > When my machine is doing big compiles like the kernel or mythtv , 
 > gcc/g++ crashes.
 > This happens after syslog tell me  that there is a recoverable error 
 > (see output below).
 > This happened several times but I don't know why and what I can do about 
 > it ..
 > The machine seems to be very stable, but it could be a hardware problem 
 > i guess.

It is. MCE's are an early sign of hardware going flaky.
Inadequate power, poor cooling etc can also trigger them.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
