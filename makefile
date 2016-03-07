CC = gcc
LINKS = -lm
FLAGS = -c -fPIC -Wall -O3
INCLUDE = /usr/local/include
LIBDIR = /usr/local/lib

librandExt.so: randExt.o
	$(CC) -shared -o librandExt.so randExt.o $(LINKS)
randExt.o: randExt.c
	$(CC) $(FLAGS) randExt.c $(LINKS)
clean:
	rm -f *.o *.so
install: randExt.so
	cp randExt.h $(INCLUDE)
	cp librandExt.so $(LIBDIR)
	ldconfig
uninstall:
	rm $(INCLUDE)/randExt.h
	rm $(LIBDIR)/librandExt.so
	ldconfig
