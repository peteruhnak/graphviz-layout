running
run
	self writeGraph.
	LibGV asFFILibrary
		dotGuarded: LibGV asFFILibrary gvContext
		baseName: self base pathString.
	(self runJobPolling: [ (self base , 'ret') exists ])
		ifFalse: [ ((self base , 'err') exists and: [ (self base , 'err') contents isNotEmpty ])
				ifTrue: [ ^ self finishError: 'Running Dot failed: ' , (self base , 'err') contents ]
				ifFalse: [ ^ self finishError ] ].
	((self base , 'ret') exists and: [ (self base , 'ret') contents asInteger = 0 ])
		ifTrue: [ ^ self finishSuccess ]
		ifFalse: [ ^ self finishError: 'Running Dot failed: ' , (self base , 'err') contents ]