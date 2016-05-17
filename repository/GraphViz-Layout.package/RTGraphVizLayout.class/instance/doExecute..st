hook
doExecute: els
	| group svg gv |
	group := els asGroup.
	directed isEmpty & undirected isEmpty
		ifTrue: [ undirected := self userDefinedEdges ifNil: [ self edges ] ].
	gv := self graph.
	self addNodesTo: gv for: els.
	self addEdgesTo: gv for: group.
	svg := self convertToSvg: graph.
	self applyLayout: (svg xPath: '//g[@class="node"]') to: group.
	self applyLayoutToEdges: (svg xPath: '//g[@class="edge"]')