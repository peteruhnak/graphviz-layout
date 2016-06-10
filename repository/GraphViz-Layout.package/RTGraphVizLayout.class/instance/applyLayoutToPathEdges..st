hook
applyLayoutToPathEdges: aCollection
	| allEdges e |
	allEdges := directed , undirected.
	aCollection
		do: [ :each |  |nE|
			e := allEdges at: (self indexFor: each).
			e view removeEdge: e.
			e view signalUpdate.
			nE := RTSVGPathLine new
				path: ((each // #path) first attributeAt: #d);
				color: (e shape colorFor: e);
				edgeFrom: e from to: e to.
			e view add: nE.
			e view signalUpdate ].
	allEdges ifNotEmpty: [ allEdges anyOne view signalUpdate ]