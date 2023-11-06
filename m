Return-Path: <linux-gcc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3659C4167B
	for <linux-gcc@archiver.kernel.org>; Mon,  6 Nov 2023 13:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjKFNPD (ORCPT <rfc822;linux-gcc@archiver.kernel.org>);
        Mon, 6 Nov 2023 08:15:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjKFNPC (ORCPT
        <rfc822;linux-gcc@vger.kernel.org>); Mon, 6 Nov 2023 08:15:02 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0003F3
        for <linux-gcc@vger.kernel.org>; Mon,  6 Nov 2023 05:14:59 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E252C433CA;
        Mon,  6 Nov 2023 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699276499;
        bh=jvfPcdqoZz0fkwZvGlxF96+iG23WZt3HwkSSBUkkKQI=;
        h=Date:From:To:Subject:From;
        b=Eb/Fcds1ak0M2CcSgcjJpBdYqZ0wuQmMQYt0PeVS+YcveT7vhcyFyyc9JtqRVqxZJ
         z80lY1qUGJ825vsh5+DBMSqSOEuRvgtKkXiz+9d9V3luYIp1M3usiVv+4xjW8NeD/d
         zAbMsXOMEdD/7ifX70ViGuZCwu8iuSNQMWrjkjMk=
Date:   Mon, 6 Nov 2023 08:14:58 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-gcc@vger.kernel.org
Subject: PSA: migrating linux-gcc to new vger infrastructure
Message-ID: <20231106-neat-organic-mole-320eee@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gcc.vger.kernel.org>
X-Mailing-List: linux-gcc@vger.kernel.org

Good day!

I plan to migrate the linux-gcc@vger.kernel.org list to the new infrastructure
this week. We're still doing it list-by-list to make sure that we don't run
into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
