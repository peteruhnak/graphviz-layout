as yet unclassified
agread: aFile
	"cgraph.h:extern Agraph_t *agread(void *chan, Agdisc_t * disc);"

	^ self ffiCall: 'void * agread(void * aFile)' module:  '/home/peter/prog/graphviz-layout/libs/usr/lib/libcgraph.so.6'