initialize-release
initialize
	super initialize.
	onError := self defaultErrorBlock.
	timeout := self defaultTimeout