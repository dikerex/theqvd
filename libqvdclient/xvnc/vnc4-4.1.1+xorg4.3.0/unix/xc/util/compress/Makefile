#
# Copyright (c) 1987 The Regents of the University of California.
# All rights reserved.
#
# Redistribution and use in source and binary forms are permitted
# provided that the above copyright notice and this paragraph are
# duplicated in all such forms and that any documentation,
# advertising materials, and other materials related to such
# distribution and use acknowledge that the software was developed
# by the University of California, Berkeley.  The name of the
# University may not be used to endorse or promote products derived
# from this software without specific prior written permission.
# THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
# WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
#	@(#)Makefile	5.9 (Berkeley) 10/15/88
#
CFLAGS=	-O -DBSD4_2 -DSACREDMEM=256000 -DUSERMEM=`cat USERMEM` 
LIBC=	/lib/libc.a
SRCS=	compress.c
OBJS=
MAN=	compress.0

all: compress

compress: USERMEM ${LIBC}
	${CC} ${CFLAGS} -o $@ $@.c

#this one is for OS/2, change location of BINMODE
BINMODE=/emx/lib/binmode.o
compress.exe: compress.c
	gcc -O -o compress.exe compress.c ${BINMODE}

# USERMEM may have to be set by hand.  It should contain the amount of
# available user memory in bytes.  Set it to zero, for physical memory
# less than 1 Meg.
USERMEM: FRC
	sh usermem.sh > USERMEM

clean:
	rm -f ${OBJS} core compress

cleandir: clean
	rm -f ${MAN} tags .depend

depend: ${SRCS}
	mkdep -p ${CFLAGS} ${SRCS}

install: ${MAN}
	install -s -o bin -g bin -m 755 compress ${DESTDIR}/usr/ucb/compress
	rm -f ${DESTDIR}/usr/ucb/uncompress ${DESTDIR}/usr/ucb/zcat
	ln ${DESTDIR}/usr/ucb/compress ${DESTDIR}/usr/ucb/uncompress
	ln ${DESTDIR}/usr/ucb/compress ${DESTDIR}/usr/ucb/zcat
	rm -f ${DESTDIR}/usr/man/cat1/uncompress.0 ${DESTDIR}/usr/man/cat1/zcat.0
	install -c -o bin -g bin -m 444 compress.0 ${DESTDIR}/usr/man/cat1
	ln ${DESTDIR}/usr/man/cat1/compress.0 ${DESTDIR}/usr/man/cat1/uncompress.0
	ln ${DESTDIR}/usr/man/cat1/compress.0 ${DESTDIR}/usr/man/cat1/zcat.0

lint: ${SRCS}
	lint ${CFLAGS} ${SRCS}

tags: ${SRCS}
	ctags ${SRCS}

FRC:
