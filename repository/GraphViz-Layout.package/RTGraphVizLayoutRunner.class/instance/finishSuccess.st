results
finishSuccess
	| contents |
	contents := (self base , 'svg') contents.
	self cleanUp.
	onSuccess value: contents