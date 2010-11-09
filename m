From: Christian Schoch <e0326715@student.tuwien.ac.at>
Subject: Changes in typecast?
Date: Tue,  9 Nov 2010 07:03:18 +0100
Message-ID: <20101109070318.7d7esknogk00gc80@webmail.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-gcc@vger.kernel.org

I had some different results when compiling the SCTP kernel module.

The point is in following equation:

abs(tp->srtt - rtt)

srtt and rtt are both of type __u32, the abs-macro is defined as abs(long).

Some time ago, I had to do a patch with
(__u32) abs( (long)srtt - (long) rtt))
for the correct result of abs(), which I do not need any more.

Has there been any changes in the last revisions of gcc regarding this 
point ???


Regards,
Schoch Christian





----- Ende der weitergeleiteten Nachricht -----


