hook
addNodesTo: gv for: els
	els
		withIndexDo: [ :each :i | 
			gv
				add: i asString
				with:
					{#id -> (#N , i asString).
					#width -> (self pixelToInch: each width).
					#height -> (self pixelToInch: each height).
					#shape -> (self graphVizShapeFor: each shape)}
						, (configuration at: #fixedSize ifPresent: [ :v | {#fixedsize -> v} ] ifAbsent: [ #() ]) ]