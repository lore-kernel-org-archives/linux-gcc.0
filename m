From: "Mike Black" <mblack@csi-inc.com>
Subject: Re: glibc 2.3
Date: Thu, 3 Oct 2002 12:11:07 -0400
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <018901c26af7$7b78dce0$f6de11cc@black>
References: <3D9C1775.9030503@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-9747-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Drepper <drepper@redhat.com>, libc-alpha@sources.redhat.com, linux-gcc@vger.kernel.org

OK...now I'm confused:
configure says:
*** On GNU/Linux systems the GNU C Library should not be installed into
*** /usr/local since this might make your system totally unusable.
*** We strongly advise to use a different prefix.  For details read the FAQ.
*** If you really mean to do this, run configure again using the extra
*** parameter `--disable-sanity-checks'.
And the FAQ says the opposite:
{ZW} If you wish to be cautious, do not configure with --prefix=/usr.  If
you don't specify a prefix, glibc will be installed in /usr/local, where it
will probably not break anything.  (If you wish to be certain, set the
prefix to something like /usr/local/glibc2 which is not used for anything.)

It appears configure is using prefix /usr/local and spits out a bogus message.

----- Original Message ----- 
From: "Ulrich Drepper" <drepper@redhat.com>
To: <libc-alpha@sources.redhat.com>; <linux-gcc@vger.kernel.org>
Sent: Thursday, October 03, 2002 6:09 AM
Subject: glibc 2.3


> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Release 2.3 of the GNU C library is now available at
> 
> ftp://sources.redhat.com/pub/glibc/releases
> 
> and (hopefully soon)
> 
> ftp://ftp.gnu.org/pub/gnu/glibc
> 
> and all the mirror sites around the globe.
> 
> The new files are
> 
> glibc-2.3.tar.bz2
> glibc-linuxthreads-2.3.tar.bz2
> glibc-2.2.5-2.3.diff.bz2
> 
> and for those following the test releases
> 
> glibc-2.2.94-2.3.diff.bz2
> 
> 
> This release introduces a number of new features but not too many.
> glibc 2.2 was already mostly complete.  Instead this release focuses
> on making functionality compliant with standards and on performance
> optimizations.  The user visible changes include:
> 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> Version 2.3
> 
> * Masahide Washizawa contributed iconv modules for IBM1163 and IBM1164
>   charsets.
> 
> * iconv (the program and the interface) now accepts empty names (excluding
>   options like //TRANSLIT) to mean "use charset of current locale".
> 
> * localedef can now transliterate characters in strings which are not in
>   the provided charmap.  The information from the input locale is used.
> 
> * Prelinking support was added for ELF targets.  This requires additional
>   tools and recent versions of the GNU binutils.  Contributed by Jakub
> Jelinek.
> 
> * Read-only stdio streams now use mmap to speed up operation by eliminating
>   copying and buffer underflows.  To use add 'm' to the mode string of
>   the fopen/fdopen/freopen call.  Implemented by Ulrich Drepper.
> 
> * The malloc functions were completely rewritten by Wolfram Gloger based
>   on Doug Lea's malloc-2.7.0.c.
> 
> * Isamu Hasegawa contributed a completely new and POSIX-conformant
>   implementation of regex.
> 
> * Bruno Haible upgraded the iconv and locale implementation to support
>   Unicode 3.2.
> 
> * Contents of the LC_* and LANG environment variables in the CEN style are
>   not recognized anymore.   It never was used.  Change by Ulrich Drepper.
> 
> * The runtime (ld.so, libc, libpthread for Linux) now can handle the ELF
>   thread-local storage (TLS) ABI on some platforms.
>   Changes by Ulrich Drepper.  SH support by Kaz Kojima.
> 
> * Bruno Haible contributed iconv converters for ISO-2022-JP-3, SHIFT
> JIS-X0213,
>   EUC-JISX0213, and TISCII.
> 
> * New header <ifaddrs.h> with functions `getifaddrs' and `freeifaddrs':
>   BSD-compatible interface for getting all network interface addresses.
>   Implementation for IPv4 by Roland McGrath.
> 
> * Loading of locale data is faster due to the introduction of a locale
>   archive.  Implemented by Roland McGrath and Ulrich Drepper.
> 
> * Startup times are significantly reduced by not using exported functions
>   inside the library itself.  Changes by Jakub Jelinek, Roland McGrath,
>   and Ulrich Drepper.
> 
> * Steven Munroe contributed a port to PowerPC64/Linux.
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> This release of the library runs on the following targets:
> 
> i[3456]86-*-gnu GNU Hurd on Intel
> i[3456]86-*-linux-gnu Linux-2.x on Intel
> alpha*-*-linux-gnu Linux-2.x on DEC Alpha
> powerpc-*-linux-gnu     Linux and MkLinux on PowerPC systems
> powerpc64-*-linux-gnu Linux-2.4.19+ on 64-bit PowerPC systems
> sparc-*-linux-gnu Linux-2.x on SPARC
> sparc64-*-linux-gnu Linux-2.x on UltraSPARC 64-bit
> ia64-*-linux-gnu Linux-2.x on ia64
> s390-*-linux-gnu Linux-2.x on IBM S/390
> s390x-*-linux-gnu Linux-2.4+ on IBM S/390 64-bit
> sh-*-linux-gnu Linux-2.x on Super Hitachi
> x86-64-*-linux-gnu Linux-2.4+ on x86-64
> 
> The following targets should not be far away from being usable:
> 
> *-*-gnu GNU Hurd on platforms other than Intel
> arm-*-linux-gnu Linux-2.x on ARM
> cris-*-linux-gnu Linux-2.4+ on CRIS
> hppa*-*-linux-gnu Linux-2.x on HP/PA
> m68k-*-linux-gnu Linux-2.x on Motorola 680x0
> mips*-*-linux-gnu Linux-2.x on MIPS
> 
> Previous releases worked on the following targets, the current status
> is unknown:
> 
> arm-*-none ARM standalone systems
> arm-*-linuxaout Linux-2.x on ARM using a.out (obsolete?!)
> 
> 
> We believe that this release is very stable.  Upgrading is highly
> encouraged.
> 
> *BUT*: updating the C library is no trivial task and it is very easy
> to damage one's system.  Therefore, persons who do not exactly know
> what to do, should consider using a binary distribution instead, when
> it becomes available.  All major Linux distributors will hopefully
> base their next release on glibc 2.3.  Don't tell us you haven't
> been warned.  Another reason why not everybody should think about
> compiling glibc is the disk and CPU requirements: on Intel platforms
> the full build requires about 330MB plus the space you need to install
> it.  This number is higher on most RISC platforms.  During the
> compilation the compiler will need large amounts of virtual memory.
> We are talking about 100MB on Intel and 200MB on Alpha.  If using the
> `-j' option of make these numbers grow linearly.  Building the
> complete library without profiling support on a 2xPIII@550MHz system
> takes about 32 minutes, checking adds another 25 minutes.  On not
> highly tuned and slower systems the times are very much higher and it
> possibly takes several days on very old and slow systems.  The '-j'
> option for make is very useful on SMP systems, the Makefiles are save
> for builds with high '-j' numbers (except when the compilation happens
> in the source directory; simply create a new directory and compile in
> that one instead).
> 
> It is generally always a good idea to build in a separate directory
> and simply configure using
> 
>   /path/to/glibc-2.3/configure ...options for configure...
> 
> Even though TLS support is mentioned as one new feature for this release
> the default is not to build glibc with TLS support enabled.  This has
> several reasons, most of which are out of control of the glibc
> developers.  Therefore it is necessry to *not* use the --with-tls option
> for configure.
> 
> 
> In case you decide to compile glibc yourself you need to read the
> files INSTALL and FAQ.  It will explain among other things which tools
> are necessary.  The most important one is the compiler.  Starting with
> this release the earliest accepted compiler is gcc 3.2.  The configure
> script will complain about any earlier compiler.
> 
> In case of problems with building glibc it is advised to first try the
> very latest sources from the stable gcc 3.2 branch.  The problems
> might already have been fixed.
> 
> 
> It is also important to get very recent binutils.  For Linux this
> normally means the releases by H.J. Lu which are available at
> 
>   ftp://ftp.kernel.org/pub/linux/devel/binutils
> 
> Version 2.13.90.0.4 has been reported to work.  Before reporting a bug
> please make sure you are using a recent version.
> 
> 
> In case you are modifying the source files which will cause autoconf
> to run make sure you have autoconf 2.13 installed and *NOT* version
> 2.50 and up.  These versions will not work.  Support for the new
> autoconf will be enabled in upcoming releases.
> 
> 
> To enable prelinking an additional package is needed.  The prelink
> program is available at
> 
>   ftp://people.redhat.com/jakub/prelink/
> 
> The last version as of this writing is
> 
>   prelink-20021002.tar.bz2
> 
> It should support all the not-embedded architectures but the demands
> on recent tools and kernels might be high.  Read the documentation
> coming with the package.  Your distribution of choice might already
> have a package available, check it first.
> 
> 
> On Linux systems the configure script has a new option
> `--enable-kernel' (find the documentation in the INSTALL file).  This
> option allows one to strip out compatibility code for older kernel
> versions.  This is of interest since configuring for a 2.4.x kernel
> reduces the libc size by about 1%.  This is no high percentage but all
> the code gone is in the by far most often used functions.  The
> compatibility code is needed because of poor design decisions of the
> kernel developers who constantly have to adjust the interface to new
> requirements.  If you never expect to run kernel versions older than
> the one used at compile time of the library it is a good idea to pass
> `--enable-kernel=current' to configure.  But be careful since with an
> older kernel the program won't even start and the whole system might
> be rendered useless (unless backup kernels are available).
> 
> 
> The 2.3.x release should be binary compatible with the 2.2 and earlier
> releases.  All correct programs should continue to run.  This does
> *not* mean that programs compiled on a system running glibc 2.3.x will
> run on systems with only glibc 2.2.  Compatibility is always in one
> direction.  Systems with glibc 2.2 will not even attempt to run
> binaries generated with glibc 2.3.x if this is not possible so there
> is not much to worry about.
> 
> The locale files are now kept in an archive which guarantees much
> faster access.  Startup times of applications using setlocale() are
> significantly improved.  The locale archive is handled by the
> localedef program just like ordinary compilation of locales.  By
> running
> 
> make localedata/install-locales
> 
> it is possible to generate an archive with all locales.
> take a while.  Using the -j option on SMP systems should help.  It is
> most of the time not necessary to install all locales.  Just pick the
> once which the users of the system will want to use.
> 
> 
> There are normally no problems to be expected when compiling code with
> the new glibc version.  In a few cases programs make wrong assumptions
> and the build will suddenly fail (recent example: using CLK_TCK in
> initializers for static or global variables which is wrong since is
> CLK_TCK is not guaranteed to be a constant).  Make sure you review
> the appropriate standards before you claim to have found a bug.
> 
> 
> Problems should all be reported using the `glibcbug' shell script.
> *NEVER* send mail to me and preferably any other developer directly; I
> won't even read it.  Mailing lists are there not only to distribute
> the workload, they also help to archive questions and answers.  this
> script, fill out the information and you are set.  If at the time you
> start the script it complains like this
> 
> /usr/bin/glibcbug: emacs: command not found
> 
> set one of the environment variables EDITOR and VISUAL (this should
> ideally happen on every system automatically):
> 
> env EDITOR=vi glibcbug
> 
> Do this also if you don't want to edit the bug report in Emacs (I
> cannot imagine why not but...)
> 
> Before sending a bug report make sure you have read the BUGS and the
> FAQ files which come with the glibc sources.  You won't even get an
> answer if it is obvious you haven't read these files.  It is also
> helpful to scan the appropriate newsgroups and mailing lists to see
> whether somebody else already had this problem.  There is another
> thing we don't want to hear about: the size.  glibc is big, but this
> is necessary for a multi-platform Unix library.
> 
> In case the bug database is once again offline send the reports to the
> libc-alpha@sources.redhat.com mailing list.
> 
> 
> Responsible for this release are among others:
> 
> Wolfram Gloger
> Bruno Haible
> Isamu Hasegawa
> Andreas Jaeger
> Jakub Jelinek
> Kaz Kojima
> H.J. Lu
> Roland McGrath
> Steven Munroe
> Andreas Schwab
> Franz Sirl
> 
> 
> I want to thank all of them.  Thanks also to the few dedicated
> testers we have:
> 
> Kaoru Fukui
> Jack Howarth
> 
> - -- 
> - --------------.                        ,-.            444 Castro Street
> Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
> Red Hat         `--' drepper at redhat.com `---------------------------
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.7 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQE9nBd12ijCOnn/RHQRAk6YAKCzhwbMdsXaLo2d42ZCvUyqP9SKzgCgkYtT
> TZrS2FWhkeVCV/WtEFvwaKE=
> =GgNw
> -----END PGP SIGNATURE-----
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
