From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Mistake With CPP File
Date: Fri, 2 Aug 2002 15:08:20 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20020802130820.GA10269@schiele.local>
References: <3D47C424.8DE7C353@cdm01.deedsmiscentral.net> <20020801070932.GA30472@schiele.local> <3D48F387.24495315@cdm01.deedsmiscentral.net> <20020801133342.GA32311@schiele.local> <3D4A7F6D.3446C6F5@cdm01.deedsmiscentral.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D4A7F6D.3446C6F5@cdm01.deedsmiscentral.net>
List-Id: <linux-gcc.vger.kernel.org>
To: deedsmis@aculink.net, linux-gcc@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2002 at 06:47:41AM -0600, SoloCDM wrote:
> It starts the linking (ln command) with /usr/bin/g++ -->
> /etc/alternatives/g++ --> /usr/bin/colorg++ --> /usr/bin/colorgcc.=20
> G++ is acting as a link.  If executed in the same manner as g++ to
> create an a.out file, without options, colorgcc doesn't execute like
> g++.

What do you have in ~/.colorgccrc?

> Is the documentation on my system to know how to use different things
> like "-lstdc++" with g++?  What would the files be?  I didn't find
> anything in the man page.

Try "info gcc".

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEVAwUBPUqERMQAnns5HcHpAQFmfQf/epw+zq4SBiUVXQ+pYL6t8Z2Dmzrm8Hns
Pegn0t4VC8FlO/MpzIqQ5JjtpwGirVebKQwSzoe6x89Okerfl2VvRTU4N5N3zf7Z
veacCJNCLYZNvLxgK8M7B8bnajiKk1d4KZI9Da18+25BXw1HH7KKRnS1WQtj84NB
ei9TY4MvvmzPNrmxvDDpM0NPYLR1zmUZossBAt5YYag4IcbBEy+d4Q5Ah7a63nC/
q41Fhhpag8UCIkk19l9e3NCeNpvZ7DzVoGHjUWcp9ILVyX3jXSdyarYkLDMUZW7v
GxIi4/fN7dKPKq74kYhcX3DrNUQGCW/d2xWGSzQKW8NpRs8cuGZq8A==
=iPUM
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
