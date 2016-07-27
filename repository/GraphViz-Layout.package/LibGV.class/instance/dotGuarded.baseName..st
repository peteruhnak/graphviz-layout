as yet unclassified
dotGuarded: aContext baseName: aBaseName
	^ self ffiCall: #(void dot_guarded #(void * aContext , String aBaseName))