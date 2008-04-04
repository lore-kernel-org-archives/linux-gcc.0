From: "H.J. Lu" <hjl.tools@gmail.com>
Subject: Change -mclmul to -mpclmul
Date: Fri, 4 Apr 2008 06:18:18 -0700
Message-ID: <20080404131818.GA8852@lucon.org>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:to:cc:subject:message-id:mime-version:content-type:content-disposition:user-agent:from;
        bh=E/oFs1tkOxZ4FhuiQZkT4Ub5aD94jMS1laS0Nr9uSG0=;
        b=vVPf+68o2jGgKFDzJzNA7X2f2lApjAC72tELApvo9a5jjkL/azym15WMohg9+Dt4WYzbs+3VQuyas+ZUjBpoBHS0dgAXVYc2zIXk3nEXA16vidBcZIaSJN8Sh4iv59QiG4s5FjWAi+WO6yZbxB0szIml6LuL8IFppH+Qpogs20g=
Content-Disposition: inline
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc@gcc.gnu.org, binutils@sources.redhat.com
Cc: GNU C Library <libc-alpha@sourceware.org>, linux-gcc@vger.kernel.org

I got a request to change gcc/assembler option, which enables
PCLMULQDQ, from -mclmul to -mpclmul, to reflect packed operation. 
Is there any objection?

Thanks.

H.J.
