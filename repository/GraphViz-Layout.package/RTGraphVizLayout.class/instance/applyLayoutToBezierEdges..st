hook
applyLayoutToBezierEdges: aCollection
	| allEdges e |
	allEdges := directed , undirected.
	aCollection
		do:
			[ :each | 
			e := allEdges at: (self indexFor: each).
"			e shape
				controllingElements:
					[ :edge | (self bezierLayoutToControlPoints: each) collect: [ :p | RTElement new translateTo: p ] ]."
			e
				update;
				signalUpdate ].
	allEdges ifNotEmpty: [ allEdges anyOne view signalUpdate ]