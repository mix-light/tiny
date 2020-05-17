#
# makefile for TINY
# Borland C Version
# K. Louden 2/3/98
#

OBJS = main.o util.o scan.o parse.o symtab.o analyze.o code.o cgen.o

tiny: $(OBJS)
	cc -o tiny $(OBJS)

main.o: main.c globals.h util.h scan.h parse.h analyze.h cgen.h
	cc -c main.c

util.o: util.c util.h globals.h
	cc -c util.c

scan.o: scan.c scan.h util.h globals.h
	cc -c scan.c

parse.o: parse.c parse.h scan.h globals.h util.h
	cc -c parse.c

symtab.o: symtab.c symtab.h
	cc -c symtab.c

analyze.o: analyze.c globals.h symtab.h analyze.h
	cc -c analyze.c

code.o: code.c code.h globals.h
	cc -c code.c

cgen.o: cgen.c globals.h symtab.h code.h cgen.h
	cc -c cgen.c

clean:
	-rm tiny
	-rm tm.exe
	-rm main.o
	-rm util.o
	-rm scan.o
	-rm parse.o
	-rm symtab.o
	-rm analyze.o
	-rm code.o
	-rm cgen.o
	-rm tm.o

tm.exe: tm.c
	cc -etm tm.c

tm: tm.exe

