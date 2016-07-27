as yet unclassified
gvNextInputGraph: gvc
	"gvc.h:extern graph_t *gvNextInputGraph(GVC_t *gvc);"

	^ self ffiCall: #(void * gvNextInputGraph #(void * gvc))