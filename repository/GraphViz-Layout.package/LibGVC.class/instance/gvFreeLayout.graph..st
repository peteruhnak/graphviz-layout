as yet unclassified
gvFreeLayout: gvc graph: graph
	"gvc.h:extern int gvFreeLayout(GVC_t *gvc, graph_t *g);"

	^ self ffiCall: #(int gvFreeLayout #(void * gvc , void * graph))