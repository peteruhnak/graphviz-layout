running
run
	| cmd |
	cmd := '(dot base.dot -Tsvg > base.svg 2> base.err & echo $! > base.pid; wait $!; echo $? > base.ret ) &'.
	self writeGraph.
	[ self primitiveSystem: (cmd copyReplaceAll: 'base' with: self base pathString) ] fork.
	(self runJobPolling: [ (self base , 'ret') exists ])
		ifFalse: [ self finishError ].
	(self base , 'ret') contents asInteger = 0
		ifTrue: [ self finishSuccess ]
		ifFalse: [ self finishError: 'Running Dot failed: ' , (self base , 'err') contents ]