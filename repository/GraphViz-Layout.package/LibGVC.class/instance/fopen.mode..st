as yet unclassified
fopen: aFile mode: aMode
	^ self ffiCall: 'void * fopen(String aFile, String aMode)' module: LibC