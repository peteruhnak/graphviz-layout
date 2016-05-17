examples
example2
| firstColumn secondColumn associations firstElements secondElements v eb |
firstColumn := #('WP A.1' 'WP A.2' 'WP A.3').
secondColumn := #('WP B.1' 'WP B.2' 'WP B.3').
associations := OrderedCollection new.
associations
	add: 'WP A.1' -> 'WP A.2';
	add: 'WP A.2' -> 'WP A.3';
	add: 'WP B.1' -> 'WP B.2';
	add: 'WP B.2' -> 'WP B.3';
	add: 'WP A.3' -> 'WP B.1';
	add: 'WP B.1' -> 'WP A.1';
	add: 'WP B.2' -> 'WP B.2';
	add: 'WP B.3' -> 'WP A.2'.
v := RTView new.
firstElements := (RTBox new
	extent: 70 @ 30;
	color:
		(Color
			r: 1.0
			g: 1.0
			b: 0.7020000000000001
			alpha: 1.0)) + RTLabel elementsOn: firstColumn.
secondElements := (RTBox new
	extent: 70 @ 30;
	color:
		(Color
			r: 0.996
			g: 0.851
			b: 0.651
			alpha: 1.0)) + RTLabel elementsOn: secondColumn.
v addAll: firstElements.
v addAll: secondElements.
secondElements translateBy: 100 @ 0.
eb := RTEdgeBuilder new.
eb view: v.
eb shape: RTMultiLine new.
eb shape color: Color black; withContinuousRectangleAttachPoint.
eb useAssociations: associations.

firstElements, secondElements @ RTDraggable.

RTGraphVizLayout new
	on: firstElements, secondElements edges: v edges.

v @ RTZoomableView @ RTDraggableView.
v open.