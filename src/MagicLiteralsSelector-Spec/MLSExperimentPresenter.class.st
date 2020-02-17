Class {
	#name : #MLSExperimentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'methodsList',
		'methodPresenter',
		'progressBar',
		'methodsSample',
		'saveStatusButton'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSExperimentPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
					spacing: 5;
					add: #methodsList;
					add: #methodPresenter;
					yourself);
		add: 'Progress:' expand: false;
		add: #progressBar expand: false;
		add: #saveStatusButton expand: false;
		yourself
]

{ #category : #initialization }
MLSExperimentPresenter >> initializePresenters [
	methodsList := self newList.
	methodsList
		display: [ :m | m displayString ];
		icons: [ :m | self iconNamed: m completionStatusIcon ].
	methodPresenter := self instantiate: MLSMethodPresenter.
	
	methodsList whenSelectionChangedDo: [ :selection |
		methodPresenter method: selection selectedItem ].
	
	progressBar := self newProgressBar.
	progressBar progress: [ methodsSample ifNil: [ 0 ] ifNotNil: #completionPercentage ] every: 0.5 second.
	
	saveStatusButton := self newButton
		label: 'Save status to file';
		icon: ((self iconNamed: #pharo ) scaledToSize: 32 @ 32);
		yourself.

]

{ #category : #accessing }
MLSExperimentPresenter >> methodsSample: aMethodsSample [
	methodsSample := aMethodsSample.
	methodsList items: aMethodsSample methods.
	
	aMethodsSample methods do: [ :m |
		m whenAnyLiteralCandidateStatusChangedDo: [ :method :literal |
			methodsList items: aMethodsSample methods ] ]
]
