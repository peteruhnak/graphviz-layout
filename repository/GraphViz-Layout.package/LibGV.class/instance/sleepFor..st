as yet unclassified
sleepFor: seconds
	^ self ffiCall: #(void sleep_for #(uint seconds))