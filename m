From: prasad.simhardi@tekelec.com
Subject: pthread not abel to create more than 250 threads, in new Linux
Date: Sun, 25 May 2003 15:30:23 -0400
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <OF5CD4E4C6.3D2394FB-ON85256D31.006B1A7F@nc.tekelec.com>
Mime-Version: 1.0
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org


Hi,

I am facing some problem, in creating more than 255 pthreads in
"linux-2.4.20-9".

The "gcc -v" gives, the following output ----------------------
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/3.2.2/specs
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man
--infodir=/usr/share/info --enable-shared --enable-threads=posix
--disable-checking --with-system-zlib --enable-__cxa_atexit
--host=i386-redhat-linux
Thread model: posix
gcc version 3.2.2 20030222 (Red Hat Linux 3.2.2-5)

The "ulimit -a" gives the following ---------------------
core file size        (blocks, -c) 0
data seg size         (kbytes, -d) unlimited
file size             (blocks, -f) unlimited
max locked memory     (kbytes, -l) unlimited
max memory size       (kbytes, -m) unlimited
open files                    (-n) 1024
pipe size          (512 bytes, -p) 8
stack size            (kbytes, -s) 8192
cpu time             (seconds, -t) unlimited
max user processes            (-u) unlimited
virtual memory        (kbytes, -v) unlimited

I am compiling it as "gcc main.c -lpthread".

using the code given below, and am able to create 1000, threads on
"linux-2.4.18-24.7.x".

where the "gcc -v" gives ------------------
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/2.96/specs
gcc version 2.96 20000731 (Red Hat Linux 7.3 2.96-113)

and "ulimit -a" gives ------------------
core file size        (blocks, -c) 0
data seg size         (kbytes, -d) unlimited
file size             (blocks, -f) unlimited
max locked memory     (kbytes, -l) unlimited
max memory size       (kbytes, -m) unlimited
open files                    (-n) 1024
pipe size          (512 bytes, -p) 8
stack size            (kbytes, -s) 8192
cpu time             (seconds, -t) unlimited
max user processes            (-u) 3840
virtual memory        (kbytes, -v) unlimited


Can anyone, tell me how to get through,

Thanks,
Prasad



/*************************** The test code is as follows
**************************************/
#include <pthread.h>

int createTask(void (*taskPtr) (void *), void *dataPtr)
{
      pthread_t threadHandle = 0;
      pthread_attr_t  attr;
      pthread_attr_init(&attr);
      if( 0 == pthread_attr_setdetachstate (&attr,
PTHREAD_CREATE_DETACHED))
      {
            if(0 != pthread_create(&threadHandle, &attr, (void *(*) (void
*))taskPtr, dataPtr))
            {
                  threadHandle = 0;
            }
            pthread_attr_destroy(&attr);
      }
      else
      {
            threadHandle = 0;
      }
      return threadHandle;
}// end createTask() method


void testThread(void *data)
{
      int   val;
      val = (int) data;
      while(1)
      {
            sleep(1);
//          printf("Test thread %d is running(%d)\n", val, time(NULL));
      }
}

int main()
{
      int i = 1;
      int failed = 0;

      for (i=1; i <=1000; i++)
      {
            if (0 == createTask(testThread, (void*) i))
            {
                  printf("Create thread failed for i = %d\n", i);
                  failed = 1;
                  break;
            }
            else
            {
                  printf("Create thread for i = %d\n", i);
            }
      }

      if (failed)
      {
            printf("Failed to create all threads ************\n");
      }
      else
      {
            printf("all threads created succesfully ************\n");
            while (1)
            {
                  sleep(1);
            }
      }
}




