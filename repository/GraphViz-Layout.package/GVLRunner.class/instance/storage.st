accessing
storage
	^ storage ifNil: [ storage := FileLocator temp asFileReference ]