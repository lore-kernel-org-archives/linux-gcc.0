From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.5.46: SCSI and/or ReiserFS v3.6 broken? Kernel panic
Date: Wed, 6 Nov 2002 00:31:09 +0100
Message-ID: <200211060031.09554.Dieter.Nuetzel@hamburg.de>
References: <200211060006.10425.Dieter.Nuetzel@hamburg.de> <3DC8521F.47270896@digeo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DC8521F.47270896@digeo.com>
Content-Disposition: inline
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Morton <akpm@digeo.com>
Cc: Linux GCC List <linux-gcc@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 6. November 2002 00:19 schrieben Sie:
> Dieter N=FCtzel wrote:
> > VFS: Cannot open root device "803" or 08:03
> > Please append a correct "root=3D" boot option
> > Kernel panic: VFS: unable to mount root fs on 08:03
>
> That was happening to me yesterday as well.  After a bit
> of poking around and recompiling, it mysteriously went away.
>
> The same has happened about ten times over the past few months,
> and rebuilding the world makes it go away.  On ext3.
>
> Something is definitely fishy.  It's unhelpful that it cures
> itself just as you get geared up to fix it.
>
> Does a full rebuild fix it for you?

Sadly, NO.

I did it first with the standard CFLAGS, then with mine, which I used for=20
several years on my Athlon systems (the later running fine with 2.5.45 as=20
always). All were full rebuilds. Then I've tried it with and without "HugeT=
LB=20
file system support".

New stuff is at the beginning of the .config file:

#
# Automatically generated make config: don't edit
#
CONFIG_X86=3Dy
CONFIG_MMU=3Dy
CONFIG_SWAP=3Dy
CONFIG_UID16=3Dy
CONFIG_GENERIC_ISA_DMA=3Dy

Here comes a diff of my running 2.5.45 .config file and the one for 2.5.46:

src/linux> diff ../linux-2.5.45/.config .config
4a5,6
> CONFIG_MMU=3Dy
> CONFIG_SWAP=3Dy
828a831
> # CONFIG_VIDEO_SAA7134 is not set
864a868
> CONFIG_HUGETLBFS=3Dy
880a885,886
> CONFIG_EXT2_FS_XATTR=3Dy
> CONFIG_EXT2_FS_POSIX_ACL=3Dy
908a915,916
> CONFIG_FS_MBCACHE=3Dm
> CONFIG_FS_POSIX_ACL=3Dy

Even without HUGETLBFS and EXT2_FS_XATTR it will not run.

=2DDieter
