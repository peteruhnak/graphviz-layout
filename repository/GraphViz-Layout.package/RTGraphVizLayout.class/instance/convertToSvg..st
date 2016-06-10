as yet unclassified
convertToSvg: aGraph
	| baseName dom |
	baseName := ('/tmp/' , UUID new asString) asFileReference.
	baseName , 'dot'
		writeStreamDo:
			[ :stream | stream nextPutAll: (graph dot copyReplaceAll: String cr with: String lf) ].
	[ self class
		system:
			('"{1}" "{2}"'
				format:
					{(FileLocator home asFileReference / 'prog' / 'graphviz-layout' / 'dot2svg' / 'dot2svg')
						pathString.
					baseName pathString}) ] fork.
	(self runJobFor: baseName)
		ifFalse: [ self error: 'Failed to apply the layout in time. Try to increse the timeout.' ].
	dom := XMLDOMParser parse: baseName , 'svg' contents.
	"(baseName , 'dot') ensureDelete.
	(baseName , 'svg') ensureDelete.
	(baseName , 'log') ensureDelete."
	^ dom