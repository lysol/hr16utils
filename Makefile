CC=gcc
# add linux stuff back here idk
LDFLAGS=
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LDFLAGS=-I/opt/homebrew/include/ -L/opt/homebrew/lib/
endif

all: clean dumptitle romutil sampleutil unrom

dumptitle: dumptitle.c flip.c
	$(CC) -o dumptitle dumptitle.c flip.c -I. $(LDFLAGS)

romutil: romutil.c flip.c
	$(CC) -o romutil romutil.c flip.c -I. $(LDFLAGS) -largp

sampleutil: readlist.c flip.c
	$(CC) -o readlist readlist.c flip.c -I. $(LDFLAGS) -largp -lsndfile

unrom: unrom.c
	$(CC) -o unrom unrom.c -I. $(LDFLAGS) -lsndfile

clean:
	rm -rf dumptitle romutil sampleutil unrom *.o