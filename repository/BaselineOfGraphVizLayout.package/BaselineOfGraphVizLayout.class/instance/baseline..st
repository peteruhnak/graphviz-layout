baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do:
			[ spec blessing: #baseline.
			spec
				project: 'GraphViz'
				with:
					[ spec
						className: #ConfigurationOfGraphViz;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
			spec package: 'GraphViz-Layout' with: #('GraphViz').
			spec group: 'default' with: #('GraphViz-Layout') ]