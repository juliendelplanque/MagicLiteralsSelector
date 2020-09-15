Class {
	#name : #BaselineOfMagicLiteralsSelector,
	#superclass : #BaselineOf,
	#category : #BaselineOfMagicLiteralsSelector
}

{ #category : #baselines }
BaselineOfMagicLiteralsSelector >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'MagicLiteralsSelector';
				package: 'MagicLiteralsSelector-Tests' with: [ spec requires: #('MagicLiteralsSelector') ];
				package: 'MagicLiteralsSelector-Spec'  with: [ spec requires: #('MagicLiteralsSelector') ]  ]
]
