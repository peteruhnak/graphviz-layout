running
runJobPolling: aBlock
	[ :job | 
	job
		title: 'Computing GraphViz layout';
		min: 1;
		max: timeout * 10.
	1 to: timeout * 10 do: [ :i | 
		aBlock value
			ifTrue: [ ^ true ].
		0.1 seconds asDelay wait.
		job increment ] ] asJob run.
	^ false