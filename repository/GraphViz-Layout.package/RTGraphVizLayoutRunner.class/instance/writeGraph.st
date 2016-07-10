file manipulation
writeGraph
	self base , 'dot'
		writeStreamDo: [ :stream | stream nextPutAll: (graph dot copyReplaceAll: String cr with: String lf) ]