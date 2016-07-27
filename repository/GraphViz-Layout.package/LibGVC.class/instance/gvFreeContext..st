as yet unclassified
gvFreeContext: gvc
	"gvc.h:extern int gvFreeContext(GVC_t *gvc);"

	^ self ffiCall: #(int gvFreeContext #(void * gvc))