as yet unclassified
agclose: graph
	"cgraph.h:extern int agclose(Agraph_t * g);"

	^ self
		ffiCall: #(int agclose #(void * graph))
		module: '/home/peter/prog/graphviz-layout/libs/usr/lib/libcgraph.so.6'