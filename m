From: Keith Whyte <keith@media-solutions.ie>
Subject: solution: 2.4.18 fork & defunct child.
Date: Wed, 19 Nov 2003 20:42:38 -0600
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <3FBC2A1E.3010901@media-solutions.ie>
References: <1069053524.3fb87654286b5@ssl.buz.org> <3FB8E40F.EF61CA7@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <3FB8E40F.EF61CA7@gmx.de>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org, linux-admin@vger.kernel.org

Folks thanks to everyone who helped me out with this, I just found the 
file 982235016-gtkrc-429249277 in /tmp
It kept reappearing as it tried to rm * -r in /tmp and
a quick google search led me to find out where it came from.

A few weeks ago i installed a binary that i got from a friends machine, 
and i just checked his machine. It has the trojan also. that explains a 
lot. It was a realserver binary (no longer available for d/l)and i ran 
it once as root as it likes to listen on port 554, before I changed that 
config and set up a user to run it. aggh. so easy to let something slip 
through. never trust binaries... no matter where they come from.

Keith.

