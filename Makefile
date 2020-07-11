PACKAGE=simple_graph
VERSION=1.0

CXX=g++
CXXFLAGS=-std=c++17 -Wall -Wextra -O2
LD=g++
LDFLAGS=
LIBS=-lSDL2_ttf -lSDL2 

prefix=/usr/local
datarootdir=${prefix}/share
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
srcdir=.

sg : bin/main.o
	$(LD) $(LDFLAGS) $(LIBS) -o bin/sg bin/main.o 

bin/main.o : src/main.cxx src/arial.hpp
	$(CXX) -c $(CXXFLAGS) -o bin/main.o src/main.cxx

src/arial.hpp : 
	echo "#ifndef ARIAL_TTF_" >> src/arial.hpp 		; \
	echo "#define ARIAL_TTF_" >> src/arial.hpp 		; \
	xxd -i resources/arial.ttf  >> src/arial.hpp 	; \
	echo "#endif//ARIAL_TTF_" >> src/arial.hpp

clean :
	rm -f bin/* ; \
	rm -f src/arial.hpp

install : sg
	cp bin/sg $(bindir)

uninstall : 
	rm -r $(bindir)/sg
