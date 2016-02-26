as yet unclassified
exampleHierarchy
| b n someClasses allMethodCategories |
someClasses := RTShape withAllSubclasses.
allMethodCategories := (someClasses flatCollect: #protocols) asSet asArray.
b := RTUMLClassBuilder new.
b lineShape color: Color black.
n := RTMultiLinearColorForIdentity new objects: allMethodCategories.
b methodShape color: [ :m | n rtValue: m protocol ].
b methodsNames: [ :cls | cls rtmethods sortedAs: #protocol ].
b addObjects: someClasses.
b layout graphVizDot.
b interaction removeInteractionOfType: RTAbstractDraggable.
b build.

b view @ RTZoomableView.
b view open.