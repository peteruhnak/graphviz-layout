as yet unclassified
gvLayout: graph engine: aString
	"gvc.h:extern int gvLayout(GVC_t *gvc, graph_t *g, const char *engine);"

	^ self ffiCall: #(int gvLayout #(void * context , void * graph , String aString))