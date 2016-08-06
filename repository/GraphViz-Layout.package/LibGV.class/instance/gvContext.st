accessing
gvContext
	"gvc.h:extern GVC_t *gvContext(void);"

	^ self ffiCall: #(void * gvContext #(void))