hook
edgePathToMultiLineFor: anEdge
	| path |
	path := (ASPathConverter new stream: ((anEdge // #path) first attributeAt: #d) readStream) convertPathData.
	^ path second second , ((path allButFirst: 3) flatCollect: #second)