as yet unclassified
gvRenderJobs: gvc graph: graph
	"gvc.h:extern int gvRenderJobs(GVC_t *gvc, graph_t *g);"

	^ self ffiCall: #(int gvRenderJobs #(void * gvc , void * graph))