accessing
default
	^ default ifNil: [ default := RTGraphVizLayoutRunnerFFI new ]