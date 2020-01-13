
CC=gcc
CFLAGS=-O3 -DNDEBUG

.c.o:
	$(CC) $(CFLAGS) -c $<

OBJS= \
aiger.o \
simpaig.o

BINS= \
aigand \
aigdd \
aigflip \
aigfuzz \
aiginfo \
aigjoin \
aigmiter \
aigmove \
aignm \
aigor \
aigreset \
aigsim \
aigsplit \
aigstrip \
aigtoaig \
aigtoblif \
aigtocnf \
aigtodot \
aigtosmv \
aigunconstraint \
aigunroll \
andtoaig \
bliftoaig \
smvtoaig \
soltostim \
wrapstim \
 \


TARGETS=$(OBJS) $(BINS)

all: $(TARGETS)

install: install-bins # install-objs
	test -d /usr
	test -d /usr/local
	test -d /usr/local/bin
	install -m 755 -s $(BINS) /usr/łocal/bin/

install-bins: $(BINS)
	
install-objs:
	@echo "*** install-objs makefile goal not finished yet"

LINKDIR=$$HOME/bin

link:
	for i in $(BINS); \
	do \
	  rm -f $(LINKDIR)/$$i; \
	  ln -s `pwd`/$$i $(LINKDIR)/$$i; \
	done

aigand: aiger.o aigand.o makefile
	$(CC) $(CFLAGS) -o $@ aigand.o aiger.o
aigbmc: aiger.o aigbmc.o makefile 
	$(CC) $(CFLAGS) -o $@ aigbmc.o aiger.o 
aigdd: aiger.o aigdd.o makefile
	$(CC) $(CFLAGS) -o $@ aigdd.o aiger.o
aigdep: aiger.o aigdep.o makefile 
	$(CC) $(CFLAGS) -o $@ aigdep.o aiger.o 
aigflip: aiger.o aigflip.o makefile
	$(CC) $(CFLAGS) -o $@ aigflip.o aiger.o
aigfuzz: aiger.o aigfuzz.o aigfuzzlayers.o makefile
	$(CC) $(CFLAGS) -o $@ aigfuzz.o aigfuzzlayers.o aiger.o
aiginfo: aiger.o aiginfo.o makefile
	$(CC) $(CFLAGS) -o $@ aiginfo.o aiger.o
aigjoin: aiger.o aigjoin.o makefile
	$(CC) $(CFLAGS) -o $@ aigjoin.o aiger.o
aigmiter: aiger.o aigmiter.o makefile
	$(CC) $(CFLAGS) -o $@ aigmiter.o aiger.o
aigmove: aiger.o aigmove.o makefile
	$(CC) $(CFLAGS) -o $@ aigmove.o aiger.o
aignm: aiger.o aignm.o makefile
	$(CC) $(CFLAGS) -o $@ aignm.o aiger.o
aigor: aiger.o aigor.o makefile
	$(CC) $(CFLAGS) -o $@ aigor.o aiger.o
aigreset: aiger.o aigreset.o makefile
	$(CC) $(CFLAGS) -o $@ aigreset.o aiger.o
aigsim: aiger.o aigsim.o makefile
	$(CC) $(CFLAGS) -o $@ aigsim.o aiger.o
aigstrip: aiger.o aigstrip.o makefile
	$(CC) $(CFLAGS) -o $@ aigstrip.o aiger.o
aigsplit: aiger.o aigsplit.o makefile
	$(CC) $(CFLAGS) -o $@ aigsplit.o aiger.o
aigtoaig: aiger.o aigtoaig.o makefile
	$(CC) $(CFLAGS) -o $@ aigtoaig.o aiger.o
aigtoblif: aiger.o aigtoblif.o makefile
	$(CC) $(CFLAGS) -o $@ aigtoblif.o aiger.o
aigtocnf: aiger.o aigtocnf.o makefile
	$(CC) $(CFLAGS) -o $@ aigtocnf.o aiger.o
aigtodot: aiger.o aigtodot.o makefile
	$(CC) $(CFLAGS) -o $@ aigtodot.o aiger.o
aigtosmv: aiger.o aigtosmv.o makefile
	$(CC) $(CFLAGS) -o $@ aigtosmv.o aiger.o
andtoaig: aiger.o andtoaig.o makefile
	$(CC) $(CFLAGS) -o $@ andtoaig.o aiger.o
aigunconstraint: aiger.o aigunconstraint.o simpaig.o makefile
	$(CC) $(CFLAGS) -o $@ aigunconstraint.o aiger.o simpaig.o
aigunroll: aiger.o aigunroll.o simpaig.o makefile
	$(CC) $(CFLAGS) -o $@ aigunroll.o aiger.o simpaig.o
bliftoaig: aiger.o bliftoaig.o makefile
	$(CC) $(CFLAGS) -o $@ bliftoaig.o aiger.o
smvtoaig: aiger.o smvtoaig.o makefile
	$(CC) $(CFLAGS) -o $@ smvtoaig.o aiger.o
soltostim: aiger.o soltostim.o makefile
	$(CC) $(CFLAGS) -o $@ soltostim.o aiger.o
wrapstim: aiger.o wrapstim.o makefile
	$(CC) $(CFLAGS) -o $@ wrapstim.o aiger.o

aigbmc.o: aiger.h aigbmc.c makefile 
	$(CC) -O3 -DNDEBUG -c aigbmc.c

aigdep.o: aiger.h aigdep.c makefile 
	$(CC)  -c aigdep.c

aigand.o: aiger.h aigand.c makefile
aigdd.o: aiger.h aigdd.c makefile
aigdep.o: aiger.h aigdep.c makefile
aiger.o: aiger.h aiger.c makefile
aigflip.o: aiger.h aigflip.c makefile
aigfuzz.o: aigfuzz.c aigfuzz.h aiger.h makefile
aigfuzzlayers.o: aigfuzzlayers.c aigfuzz.h aiger.h makefile
aiginfo.o: aiginfo.c aiger.h makefile
aigjoin.o: aigjoin.c aiger.h makefile
aigmiter.o: aigmiter.c aiger.h makefile
aigmove.o: aigmove.c aiger.h makefile
aignm.o: aignm.c aiger.h makefile
aigor.o: aigor.c aiger.h makefile
aigreset.o: aigreset.c aiger.h makefile
aigsim.o: aigsim.c aiger.h makefile
aigsplit.o: aigsplit.c aiger.h makefile
aigstrip.o: aigstrip.c aiger.h makefile
aigtoaig.o: aigtoaig.c aiger.h makefile
aigtoblif.o: aigtoblif.c aiger.h makefile
aigtocnf.o: aigtocnf.c aiger.h makefile
aigtodot.o: aigtodot.c aiger.h makefile
aigtosmv.o: aigtosmv.c aiger.h makefile
aigunconstraint.o: aiger.h simpaig.h aigunconstraint.c makefile
aigunroll.o: aiger.h simpaig.h aigunroll.c makefile
andtoaig.o: andtoaig.c aiger.h makefile
bliftoaig.o: bliftoaig.c aiger.h makefile
simpaig.o: simpaig.h simpaig.c makefile
smvtoaig.o: smvtoaig.c aiger.h makefile
soltostim.o: soltostim.c aiger.h makefile
wrapstim.o: wrapstim.c aiger.h makefile

clean:
	rm -f *.o 
	rm -f $(TARGETS)
	rm -f makefile

.PHONY: all clean link install install-objs install-bins
