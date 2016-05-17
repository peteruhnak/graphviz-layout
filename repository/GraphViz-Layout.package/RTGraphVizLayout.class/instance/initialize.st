initialize-release
initialize
	super initialize.
	directed := #().
	undirected := #().
	configuration := Dictionary new.
	self resetGraph.
	self fixedSize.
	verticalGap := self inchToPixel: 1.
	horizontalGap := self inchToPixel: 1.
	timeout := self defaultTimeout