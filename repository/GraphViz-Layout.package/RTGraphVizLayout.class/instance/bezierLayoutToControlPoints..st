hook
bezierLayoutToControlPoints: anEdge
	^ (ASPathConverter new stream: ((anEdge // #path) first attributeAt: #d) readStream) convertPathData fourth second allButLast