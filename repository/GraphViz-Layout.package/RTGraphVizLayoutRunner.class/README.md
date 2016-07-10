My responsibility is to launch external 'dot' process and collect the result.

If the process doesn't finish in time then I will kill it.

## Usage

```
RTGraphVizLayoutRunner new
	onSuccess: [ :svgString | ... ];
	runOnGraph: aGraph
```
	
or lenghtier (with explicit default options):

```
RTGraphVizLayoutRunner new
	onSuccess: [  :svgString | ... ];
	onError: [ :msg | self error: msg ];
	graph: aGraph;
	timeout: 10;
	run
```