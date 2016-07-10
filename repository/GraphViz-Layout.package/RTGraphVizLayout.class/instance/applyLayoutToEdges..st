hook
applyLayoutToEdges: aCollection
	| allEdges |
	allEdges := directed , undirected.
	(allEdges allSatisfy: [ :each | each shape isKindOf: RTSVGPathLine ])
		ifTrue: [ ^ self applyLayoutToPathEdges: aCollection ].
	(allEdges allSatisfy: [ :each | each shape isKindOf: RTMultiLine ])
		ifTrue: [ ^ self applyLayoutToMultiLineEdges: aCollection ].
	(allEdges allSatisfy: [ :each | each shape isKindOf: RTLine ])
		ifTrue: [ ^ self applyLayoutToPathEdges: aCollection ].
	Smalltalk globals
		at: #DCRTConnection
		ifPresent: [ :class | 
			(allEdges allSatisfy: [ :each | each shape isKindOf: class ])
				ifTrue: [ ^ self applyLayoutToConnectionEdges: aCollection ] ].
	self error: 'One of the edges has an unsupported shape type.'