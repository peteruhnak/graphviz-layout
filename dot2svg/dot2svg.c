#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

void convert(char* base_name) {
	pid_t pid = 0;
	pid = fork();

	if (pid < 0) {
		fprintf(stderr, "Error forking.\n");
		exit(1);
	}

	if (pid > 0) {
		exit(0);
	}

	if (pid == 0) {
		char command[128];
		snprintf(command, 128, "/home/peter/prog/graphviz-layout/dot2svg/dot2svg.sh %s", base_name);
		system(command);
		exit(0);
	}
}

int main(int argc, char** argv) {
	FILE* fw = fopen("/tmp/log.txt", "a");
	fprintf(fw, "dot2svg started\n");
	fclose(fw);
	if (argc < 2) {
		fprintf(stderr, "Usage: %s BASENAME\n", argv[0]);
		exit(1);
	}
	convert(argv[1]);
	exit(0);
}
