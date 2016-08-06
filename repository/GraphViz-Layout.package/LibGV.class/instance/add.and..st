external calls
add: anA and: aB
	^ self ffiCall: #(int add #(int anA , int aB))