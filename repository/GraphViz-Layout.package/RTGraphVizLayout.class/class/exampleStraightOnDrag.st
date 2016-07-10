examples
exampleStraightOnDrag
	"## WIP ##"
| v nodes e1 e2 e3 e4 newEdgeBuilder |
v := RTView new.

nodes := RTEllipse new
	width: 27*2;
	height: 18*2;
	elementsOn: #(c b e).

v addAll: nodes.
nodes @ (RTLabeled new color: Color black; center).

e1 := RTLine new edgeFrom: nodes first to: nodes second.
v add: e1.

e2 := RTLine new edgeFrom: nodes first to: nodes third.
v add: e2.

e3 := RTLine new edgeFrom: nodes second to: nodes third.
v add: e3.

e4 := RTLine new edgeFrom: nodes third to: nodes third.
v add: e4.

nodes @ RTDraggable.

newEdgeBuilder := [ :oldEdge |
	RTLine new
		color: (oldEdge shape colorFor: oldEdge);
		attachPoint: RTRectangleAttachPoint instance;
		edgeFrom: oldEdge from to: oldEdge to.
].

nodes do: [ :each |
	each when: TRMouseDragStart do: [ :evt |
		each 
	].
].


RTGraphVizLayout new on: nodes edges: v edges.

v inspect