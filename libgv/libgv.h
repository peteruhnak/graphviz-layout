#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <graphviz/gvc.h>
#include <time.h>
#include <errno.h>

extern int add(int a, int b);

extern int dot(GVC_t* gvc, const char* in_name, const char* out_name);

extern void dot_guarded(GVC_t* gvc, const char* base_name);

extern void sleep_for(unsigned int seconds);

void sleep_for(unsigned int seconds);
