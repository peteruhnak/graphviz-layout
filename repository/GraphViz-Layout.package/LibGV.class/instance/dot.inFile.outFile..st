accessing
dot: aContext inFile: inName outFile: outName
	^ self ffiCall: #(void dot #(void * aContext , String inName , String outName))