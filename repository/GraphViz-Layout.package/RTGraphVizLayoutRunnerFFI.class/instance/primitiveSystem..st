primitives
primitiveSystem: command
	^ self ffiCall: #(int system #(char * command)) module: LibC