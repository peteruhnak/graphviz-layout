.PHONY: all clean

PKGS=libltdl7 libxdot4 libcdt5 libcgraph6 libpathplan4 libgvc6

LIB_DIR=usr/lib

all: usr

usr: $(PKGS)
	for pkg in *.deb; do \
		dpkg -x $$pkg . ; \
	done
	touch usr
	cp config6a $(LIB_DIR)/graphviz
	./link_libs.sh

lib%:
	apt-get download "$@:i386"

usr/lib/graphviz/config6a:
	LD_LIBRARY_PATH="$(LIB_DIR);$(LIB_DIR)/i386-linux-gnu;$(LIB_DIR)/graphviz"	usr/sbin/libgvc6-config-update -c

clean:
	rm -rf usr
	rm -f *.deb
