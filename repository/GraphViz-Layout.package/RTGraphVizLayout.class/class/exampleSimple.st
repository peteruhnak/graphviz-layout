examples
exampleSimple
| v defaultPathBuilder nodes e1 e2 e3 e4 newEdgeBuilder |
v := RTView new.

defaultPathBuilder := [ :edge | String streamContents: [ :s |
			s
				nextPutAll: 'M';
				nextPutAll: edge from position x asString;
				nextPutAll: ',';
				nextPutAll: edge from position y asString;
				nextPutAll: ' ';
				nextPutAll: edge to position x asString;
				nextPutAll: ',';
				nextPutAll: edge to position y asString
]].

nodes := RTEllipse new
	width: 27*2;
	height: 18*2;
	borderColor: Color black;
	elementsOn: #(c b e).

v addAll: nodes.
nodes @ (RTLabeled new color: Color black; center).

e1 := RTSVGPathLine new
	path: defaultPathBuilder;
	color: Color black;
	edgeFrom: nodes first to: nodes second.
v add: e1.

e2 := RTSVGPathLine new
	path: defaultPathBuilder;
	color: Color black;
	edgeFrom: nodes first to: nodes third.
v add: e2.

e3 := RTSVGPathLine new
	path: defaultPathBuilder;
	color: Color black;
	edgeFrom: nodes second to: nodes third.
v add: e3.

e4 := RTSVGPathLine new
	path: defaultPathBuilder;
	color: Color black;
	edgeFrom: nodes third to: nodes third.
v add: e4.

"nodes first translateTo: 27 @ -162.
nodes second translateTo: 27 @ -90.
nodes third translateTo: 27 @ -18."

nodes @ RTDraggable.

newEdgeBuilder := [ :oldEdge |
	RTLine new
		color: (oldEdge shape colorFor: oldEdge);
		attachPoint: RTRectangleAttachPoint instance;
		edgeFrom: oldEdge from to: oldEdge to.
].



RTGraphVizLayout new on: nodes edges: v edges.

v inspect