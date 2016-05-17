hook
graphVizShapeFor: aShape
	(aShape isKindOf: RTEllipse)
		ifTrue: [ ^ #ellipse ].
	(aShape isKindOf: RTBox)
		ifTrue: [ ^ #box ].
	self error: 'Unknown shape ' , aShape className