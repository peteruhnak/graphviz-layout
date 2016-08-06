accessing
basename
	^ basename ifNil: [ basename := UUID new asString ]