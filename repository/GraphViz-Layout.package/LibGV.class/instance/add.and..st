as yet unclassified
add: anA and: aB
	^ self ffiCall: #(int add #(int anA , int aB))