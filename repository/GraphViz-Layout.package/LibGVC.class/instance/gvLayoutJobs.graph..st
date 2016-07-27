as yet unclassified
gvLayoutJobs: gvc graph: graph
	"gvc.h:extern int gvLayoutJobs(GVC_t *gvc, graph_t *g);"

	^ self ffiCall: #(int gvLayoutJobs #(void * gvc , void * graph))