From: Naga Raju <raj1234@gmail.com>
Subject: Re: Shared libraries: How to share global variaables?
Date: Sat, 30 Oct 2004 18:43:43 +0530
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <e9ddb88e041030061353257652@mail.gmail.com>
References: <S263586AbUJ3FQs/20041030051648Z+543@vger.kernel.org>
	 <e9ddb88e04102922207ce4eb04@mail.gmail.com>
	 <e9ddb88e04102922215362c31b@mail.gmail.com>
	 <200410301450.15154.robin@robind.de>
Reply-To: Naga Raju <raj1234@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <200410301450.15154.robin@robind.de>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org

Hi Robin,
Thanks for the help.
But my problem is little different.
In the example you have given, I initialized

char foo[100]="";

and in one application I set

application 1:

extern char foo[100];
strcpy(foo,"Test message");
printf("%s",foo);

and in applications 2:
extern char foo[100];
printf("%s",foo);

But application1 disaplays

Test message.

application2:

(No output ..it prints '\0' )

I want application2 to display "Test message"

Why the variables in two applications are different?
Why are they not using the same global variable?

Regards,
Nagaraju



On Sat, 30 Oct 2004 14:50:11 +0200, Robin Doer <robin@robind.de> wrote:
> Am Samstag, 30. Oktober 2004 07:21 schrieb Naga Raju:
> 
> 
> > Is it possible to share global variables such that all applications
> > which use shared libraries can see the changes made to the global
> > variables by the other applications.
> >
> > I use gcc and compiled
> >       gcc -shared -Wl,-soname,xyz.so.1 -o libxyz.so.1.0 -lxyz2  abc.o
> >
> 
> Well, imho you can use the "extern" keyword.
> 
> See the following example:
> 
> bash-2.05b$ cat foo.c
> const char* foo = "Hello World"; /* Global variable foo */
> 
> bash-2.05b$ cat bar.c
> #include <stdio.h>
> 
> extern const char* foo;
> 
> int main(int argc, char* argv[]) {
>  printf("%s\n", foo);
> 
>  return 0;
> }
> 
> bash-2.05b$ gcc -shared -Wl,-soname,libfoo.so -o libfoo.so foo.c
> bash-2.05b$ gcc -Wall bar.c -L. -lfoo -o bar
> bash-2.05b$ ./bar
> Hello World
> 
> > Regards,
> > Nagaraju.
> 
> Bye,
> Robin
> 
> 
>
