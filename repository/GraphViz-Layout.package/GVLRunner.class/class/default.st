accessing
default
	^ default ifNil: [ default := GVLSystemFFIRunner new ]