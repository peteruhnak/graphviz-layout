#include "libgv.h"

int add(int a, int b) {
	return a+b;
}

int dot(GVC_t* gvc, const char* in_name, const char* out_name) {
	FILE* file_in = fopen(in_name, "r");
	if (!file_in) {
		fprintf(stderr, "Failed to open in file [%d]\n", errno);
		return 1;
	}
	Agraph_t* g = agread(file_in, NULL);
	fclose(file_in);
	if (!g) {
		fprintf(stderr, "Failed to read the graph\n");
		return 1;
	}

	int layout_result = gvLayout(gvc, g, "dot");
	if (layout_result > 0) {
		fprintf(stderr, "Failed to apply the layout\n");
		return 1;
	}

	FILE* file_out = fopen(out_name, "w");
	if (!file_out) {
		fprintf(stderr, "Failed to open out file [%d]\n", errno);
		gvFreeLayout(gvc, g);
		agclose(g);
		return 1;
	}

	int render_result = gvRender(gvc, g, "svg", file_out);

	fclose(file_out);
	gvFreeLayout(gvc, g);
	agclose(g);

	if (render_result > 0) {
		fprintf(stderr, "Failed to render the graph\n");
		return 1;
	}
	return 0;
}

char* with_suffix(const char* base, const char* suffix) {
	char* name = malloc(strlen(base) + strlen(suffix) + 1);
	sprintf(name, "%s%s", base, suffix);
	return name;
}

// Daemons for dummies: http://www.itp.uzh.ch/~dpotter/howto/daemonize
void dot_guarded(GVC_t* gvc, const char* base_name) {
	pid_t pid = 0;
	pid = fork();

	if (pid < 0) {
		fprintf(stderr, "Error forking.\n");
		exit(1);
	}

	// parent process
	if (pid > 0) {
		char* pid_name = with_suffix(base_name, ".pid");
		FILE* file_pid = fopen(pid_name, "w");
		fprintf(file_pid, "%d\n", pid);
		fclose(file_pid);
		free(pid_name);
		return;
	}

	umask(0);

	pid_t sid = setsid();
	if (sid < 0) {
		exit(1);
	}

	char* err_name = with_suffix(base_name, ".err");
	freopen("/dev/null", "r", stdin);
	freopen("/tmp/daemon.out", "w", stdout);
	freopen(err_name, "w", stderr);
	free(err_name);

	char* in_name = with_suffix(base_name, ".dot");
	char* out_name = with_suffix(base_name, ".svg");

	int result = dot(gvc, in_name, out_name);

	free(out_name);
	free(in_name);

	char* guard_name = with_suffix(base_name, ".ret");
	FILE* file_guard = fopen(guard_name, "w");
	fprintf(file_guard, "%d\n", result);
	fclose(file_guard);
	free(guard_name);

	exit(0);
}

void basic_sleep_for(unsigned int seconds) {
	fprintf(stderr, "sleep_for(%u)\n", seconds);
	fprintf(stderr, "taking a nap...");
	clock_t start, end;
	start = clock();
	end = clock();
	while (((double) (end - start)) / CLOCKS_PER_SEC < seconds) {
		end = clock();
	}
	fprintf(stderr, "done\n");
}

void sleep_for(unsigned int seconds) {
	pid_t pid = 0;
	pid = fork();

	if (pid < 0) {
		fprintf(stderr, "Error forking.\n");
		exit(1);
	}

	if (pid > 0) {
		return;
	}

	if (pid == 0) {
		basic_sleep_for(seconds);
		exit(0);
	}
}
