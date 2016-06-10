as yet unclassified
applyLayoutToConnectionEdges: aCollection
	| allEdges |
	allEdges := directed , undirected.
	aCollection
		do: [ :each | 
			| c e |
			e := allEdges at: (self indexFor: each).
			c := Color random.
			e shape router points: (self edgeLayoutToRoute: each) allButFirst allButLast.
			e
				update;
				signalUpdate ].
	allEdges ifNotEmpty: [ allEdges anyOne view signalUpdate ]