.PHONY: clean

MAIN=main
LIB=libgv.so
ARCH=-m32
LIBS_DIR=/home/peter/prog/graphviz-layout/libs/usr/lib
LPATH=-L$(LIBS_DIR) -L$(LIBS_DIR)/i386-linux-gnu
LIB_DEPS=-lgvc -lcgraph
#LDEPS=-L$(LIBS_DIR)
RPATH=-Wl,-rpath,$(LIBS_DIR),-rpath,$(LIBS_DIR)/i386-linux-gnu
#RPATH=-Wl,-rpath,$(LIBS_DIR)

build: $(MAIN) $(LIB)

run: build
	./$(MAIN)

%.so: %.o
	gcc $(ARCH) -shared -Wall -Wpedantic $(LPATH) $(RPATH) -Wl,--no-undefined $(LIB_DEPS) -o $@ $<

%.o: %.c %.h
	gcc $(ARCH) -c -Wall -Wpedantic -fPIC $<

$(MAIN): $(MAIN).c $(LIBS_DIR)/$(LIB)
	gcc $(ARCH) -g -Wall -Wpedantic $(LPATH) $(RPATH) -Igraphviz $(LIB_DEPS) -lgv $^ -o $@

$(LIBS_DIR)/$(LIB): $(LIB)
	ln -s `readlink -f $<` $@

clean:
	rm -f $(MAIN)
	rm -f $(LIB)
