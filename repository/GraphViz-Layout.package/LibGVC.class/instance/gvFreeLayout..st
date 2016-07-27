as yet unclassified
gvFreeLayout: aGraph
	"gvc.h:extern int gvFreeLayout(GVC_t *gvc, graph_t *g);"

	^ self ffiCall: #(int gvFreeLayout #(void * context , void * aGraph))