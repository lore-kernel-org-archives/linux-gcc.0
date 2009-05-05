From: andreas.ames@de.transport.bombardier.com
Subject: Some basic questions from a userland jerk about kernel binary format
Date: Tue, 5 May 2009 15:08:03 +0200
Message-ID: <OF6AAEE414.9F24ED82-ONC12575AD.00483B21-C12575AD.0048472C@bombardier.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-gcc@vger.kernel.org

Hi all,=20

I hope my topic is appropriate for this list, if not please point me=20
in the right direction.=20

I know the thing I want to achieve is strange as I could do the same=20
better by using the dynamic module loader.  Unfortunately I've got to=20
port an application from another OS and I'm currently not able to=20
change the inner workings too much.=20

What I want to achieve is to dynamically access arbitrary variables in=20
my kernel module by determining the offset of the variable's address=20
offline as an offest regarding a common base address within my=20
module.  To achieve that I need to know the following:=20

1. How many segments does a kernel module binary usually have? Is it=20
   the same as in userland, i.e. .bss, .data and .text? Or are there=20
   others or only a single one?=20

2. (How) can I instruct the linker to put a certain variable 'near'=20
   the beginning of each segment? This would become my base address,=20
   one for each segment.  I would use the dynamic loader to access=20
   this base address at runtime.  The most important prerequisite=20
   would be that this base address needs to be 'in front of' every=20
   application variable.=20

3. I want to use binutils/nm to compute the offset of my application=20
   variables in terms of their distance to the relevant base address.=20
   This can obviously change from revision to revision of my my=20
   module, which is ok.  Is that viable (I don't know the dynamic=20
   linker of the kernel)?=20

4. At runtime I want to compute my application variable's address by:=20

   real_adr =3D base address + offset=20

   Is that also ok?=20


TIA,=20

Andreas Ames=20

--
=20
 =20
Please consider the environment before you print / Merci de penser =E0=20
l'environnement avant d'imprimer / Bitte denken Sie an die Umwelt bevor=
=20
Sie drucken=20

Bombardier Transportation GmbH=20
Vorsitzender des Aufsichtsrats / Chairman of Supervisory Board: Peter W=
itt=20

Gesch=E4ftsf=FChrung / Executive Board: Dr. Klaus Baur=20
(Vorsitzender/Chairman), Luc Charlemagne, Stephan Krenz, Stefan Sch=F6n=
holz=20
Sitz der Gesellschaft / Principal Office: Berlin=20
Registergericht / Registration Court: Amtsgericht Charlottenburg, HRB=20
64838=20

_______________________________________________________________________=
________________________________________=20

This e-mail communication (and any attachment/s) may contain confidenti=
al=20
or privileged information and is intended only for the individual(s) or=
=20
entity named above and to others who have been specifically authorized =
to=20
receive it. If you are not the intended recipient, please do not read,=20
copy, use or disclose the contents of this communication to others. Ple=
ase=20
notify the sender that you have received this e-mail in error by reply=20
e-mail, and delete the e-mail subsequently. Please note that in order t=
o=20
protect the security of our information systems an AntiSPAM solution is=
 in=20
use and will browse through incoming emails.=20
Thank you.=20
_______________________________________________________________________=
__________________________________________=20


Ce message (ainsi que le(s) fichier(s)), transmis par courriel, peut=20
contenir des renseignements confidentiels ou prot=E9g=E9s et est destin=
=E9 =E0=20
l?usage exclusif du destinataire ci-dessus. Toute autre personne est, p=
ar=20
les pr=E9sentes, avis=E9e qu?il est strictement interdit de le diffuser=
, le=20
distribuer ou le reproduire. Si vous l?avez re=E7u par inadvertance,=20
veuillez nous en aviser et d=E9truire ce message. Veuillez prendre note=
=20
qu'une solution antipollupostage (AntiSPAM) est utilis=E9e afin d'assur=
er la=20
s=E9curit=E9 de nos syst=E8mes d'information et qu'elle fur=E8tera les =
courriels=20
entrants.
Merci.=20
_______________________________________________________________________=
__________________________________________=20


