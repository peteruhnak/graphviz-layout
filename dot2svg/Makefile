.PHONY: clean

all: dot2svg

dot2svg: dot2svg.c
	gcc -Wall -pedantic $< -o $@

clean:
	rm -f dot2svg
