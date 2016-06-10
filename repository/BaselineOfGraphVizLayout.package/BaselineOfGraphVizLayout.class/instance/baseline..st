baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec
				project: 'Athens'
				with: [ spec
						className: #ConfigurationOfAthens;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/Pharo/Athens/main/';
						loads: 'SVG' ].
			spec
				package: 'GraphViz'
				with: [ spec repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
			spec package: 'GraphViz-Layout' with: [ spec requires: #('GraphViz' 'Athens') ].
			spec group: 'default' with: #('GraphViz-Layout') ]