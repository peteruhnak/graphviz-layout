hook
doExecute: els
	| gv group layout |
	gv := self createEmptyGraph.
	group := els asGroup.
	directed isEmpty & undirected isEmpty
		ifTrue: [ undirected := self edges ].
	self addNodesTo: gv for: els.
	self addEdgesTo: gv for: group.
	false
		ifTrue: [ self haltOnce. gv generator dotSourceWithLineFeedTerminators.
			gv openInWindow ].
	layout := XMLDOMParser parse: (gv asOutputType: 'svg').
	self applyLayout: (layout xPath: '//g[@class="node"]') to: group.
	self applyLayoutToEdges: (layout xPath: '//g[@class="edge"]')