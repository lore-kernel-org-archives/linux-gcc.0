From: Paula Berger <pberger@inf.ufrgs.br>
Subject: IOCTL problem!!!
Date: Tue, 28 Oct 2003 16:46:37 +0000
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <200310281642.35530.pberger@inf.ufrgs.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-gcc.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org


	Hi everybody.. I'm new here, so let's see if you guys can help me :-)

	I'm trying to use the ioctl function with the SIOCADDRT flag and I'm having 
some problems! What i want to do is simply add the default gateway to my 
routing table. I'm using the struct rtentry (don't know if I'm using it 
correctly though) then I create a datagram socket and the I use the ioctl 
function... Does anyone know what's wrong? 
	I'm sending my source as an example... if someone could please help me, I 
REALLY nedd to do this!!!
	Thanks,

--
Paula Berger
E-mail: pberger@inf.ufrgs.br
--

EXAMPLE:

int main() {
	uint32_t IpAddr;
	uint32_t Dst;
	uint32_t GenMask;
	struct sockaddr_in Route;
	struct rtentry Entry;
	int SockFd, res = 0;

	memset ((char *)&Entry, 0, sizeof (struct rtentry));

	Entry.rt_gateway.sa_family = AF_INET;
	Entry.rt_genmask.sa_family = AF_INET;
	Entry.rt_dst.sa_family = AF_INET;
	Entry.rt_flags = RTF_UP | RTF_GATEWAY;

	if(inet_aton("0.0.0.0", (struct in_addr *)&GenMask) == 0)
		printf("\nroute genmasc error\n");

	if(inet_aton("143.54.83.0", (struct in_addr *)&Dst) == 0)
		printf("\nroute dst error\n");

	if(inet_aton("143.54.83.1", (struct in_addr *)&IpAddr) == 0)
		printf("\nroute ip error\n");

	Route.sin_addr.s_addr = htonl(IpAddr);
	memcpy(&Entry.rt_gateway, &Route, sizeof(struct sockaddr));

	Route.sin_addr.s_addr = htonl(Dst);
	memcpy(&Entry.rt_dst, &Route, sizeof(struct sockaddr));

	Route.sin_addr.s_addr = htonl(GenMask);
	memcpy(&Entry.rt_genmask, &Route, sizeof(struct sockaddr));

	if ((SockFd = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
		perror("socket");
		return -1;
    	}

	res = ioctl(SockFd, SIOCADDRT, &Entry);

	if (res < 0) {
            perror("\nerror: ");
	    close(SockFd);
	    return -1;
        }

	close(SockFd);

	return 0;
}
