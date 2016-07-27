as yet unclassified
agmemread: aString
	"h:extern Agraph_t *agmemread(const char *cp);"

	^ self ffiCall: 'void * agmemread(String aString)'