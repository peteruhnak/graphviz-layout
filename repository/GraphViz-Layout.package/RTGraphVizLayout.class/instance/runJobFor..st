as yet unclassified
runJobFor: aBaseName
	[ :job | 
	job
		title: 'Applying GraphViz layout';
		min: 1;
		max: 50.
	job min to: job max do: [ :i | 
		(aBaseName , 'complete') exists
			ifTrue: [ ^ true ].
		0.1 second asDelay wait.
		job increment ] ] asJob run.
	^ false