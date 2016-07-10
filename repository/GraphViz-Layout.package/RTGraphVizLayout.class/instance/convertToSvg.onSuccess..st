as yet unclassified
convertToSvg: aGraph onSuccess: aOneArgBlock
	| runner |
	runner := RTGraphVizLayoutRunnerFFI new.
	runner
		graph: graph;
		timeout: timeout;
		onSuccess: [ :contents | aOneArgBlock value: (XMLDOMParser parse: contents) ];
		run