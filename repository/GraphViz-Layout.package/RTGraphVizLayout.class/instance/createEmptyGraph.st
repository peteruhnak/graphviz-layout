hook
createEmptyGraph
	| gv |
	(gv := GraphViz new)
		beDirected;
		"add: #graph
			with:
			{#splines -> #ortho.
			#ranksep -> 1.
			#nodesep -> 1.
			#rankdir -> #TB};"
		"add: #node
			with:
			{#shape -> #box.
			#fixedsize -> true}"
		yourself.
	^ gv