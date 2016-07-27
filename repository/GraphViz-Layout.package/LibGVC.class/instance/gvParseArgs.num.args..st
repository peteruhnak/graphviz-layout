as yet unclassified
gvParseArgs: gvc num: argc args: argv
	"gvc.h:extern int gvParseArgs(GVC_t *gvc, int argc, char **argv);"

	^ self ffiCall: #(int gvParseArgs #(void * gvc , int argc , void * argv))