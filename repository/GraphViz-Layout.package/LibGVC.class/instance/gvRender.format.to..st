as yet unclassified
gvRender: graph format: aFormat to: aFileOut
	"gvc.h:extern int gvRender(GVC_t *gvc, graph_t *g, const char *format, FILE *out);"

	^ self
		ffiCall: #(int gvLayout #(void * context , void * graph , String aFormat , void * aFileOut))