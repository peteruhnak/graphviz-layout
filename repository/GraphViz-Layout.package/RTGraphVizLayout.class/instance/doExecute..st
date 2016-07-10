hook
doExecute: els
	| group gv |
	group := els asGroup.
	directed isEmpty & undirected isEmpty
		ifTrue: [ undirected := self userDefinedEdges ifNil: [ self edges ] ].
	gv := self graph.
	self addNodesTo: gv for: els.
	self addEdgesTo: gv for: group.
	self
		convertToSvg: graph
		onSuccess: [ :svg | 
			self applyLayout: (svg xPath: '//g[@class="node"]') to: group.
			self applyLayoutToEdges: (svg xPath: '//g[@class="edge"]') ]