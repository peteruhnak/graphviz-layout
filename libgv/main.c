#include <stdio.h>
#include "libgv.h"

int main(int argc, char **argv) {
	GVC_t *gvc = gvContext();

	dot_guarded(gvc, "/tmp/graph");
	//dot(gvc, "/tmp/in.dot", "/tmp/out.dot");

	return gvFreeContext(gvc);
}
