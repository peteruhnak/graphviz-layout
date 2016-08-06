results
finishError: aMessage
	| pid |
	pid := (self base , 'pid') contents.
	self cleanUp.
	self killProcess: pid.
	onError value: aMessage