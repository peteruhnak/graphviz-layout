hook
nodePositionFor: aNode
	(aNode / #ellipse) anyOne ifNotNil: [ :e | ^ (e attributeAt: #cx) asNumber @ (e attributeAt: #cy) asNumber ].
	(aNode / #polygon) anyOne
		ifNotNil: [ :p | 
			| corners |
			corners := ((p attributeAt: #points) splitOn: ' ') collect: [ :each | self positionFrom: each ].
			^ (corners min corner: corners max) center ].
	self error: 'Unrecognized node.'