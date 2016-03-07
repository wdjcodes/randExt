CC = gcc
LINKS = -lm
FLAGS = -c -fPIC -Wall -O3
INCLUDE = /usr/local/include
LIBDIR = /usr/local/lib

randExt.so: randExt.o
	$(CC) -shared -o randExt.so randExt.o $(LINKS)
randExt.o: randExt.c
	$(CC) $(FLAGS) randExt.c $(LINKS)
clean:
	rm -f *.o *.so
install: randExt.so
	cp randExt.h $(INCLUDE)
	cp randExt.so $(LIBDIR)
	ldconfig
uninstall:
	rm $(INCLUDE)/randExt.h
	rm $(LIBDIR)/randExt.so
	ldconfig
