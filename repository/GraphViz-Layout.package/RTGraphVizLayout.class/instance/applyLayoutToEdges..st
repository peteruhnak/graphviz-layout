hook
applyLayoutToEdges: aCollection
	| allEdges |
	allEdges := directed , undirected.
	(allEdges allSatisfy: [ :each | each shape isKindOf: RTSVGPathLine ])
		ifTrue: [ ^ self applyLayoutToPathEdges: aCollection ].
	(allEdges allSatisfy: [ :each | each shape isKindOf: RTMultiLine ])
		ifTrue: [ ^ self applyLayoutToMultiLineEdges: aCollection ].
	(allEdges allSatisfy: [ :each | each shape isKindOf: #DCRTConnection asClass ])
		ifTrue: [ ^ self applyLayoutToConnectionEdges: aCollection ].
	self error: 'One of the edges has an unsupported shape type.'