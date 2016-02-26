hook
edgeLayoutToRoute: anEdge
	^ self
		collinearizeRoute:
			((ASPathConverter new stream: ((anEdge // #path) first attributeAt: #d) readStream)
				convertPathData flatCollect: #second)