Class {
	#name : #MLSExperimentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'methodsList',
		'methodPresenter',
		'progressBar',
		'methodsSample',
		'saveSelectionsButton'
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
		add: #saveSelectionsButton expand: false;
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
	
	saveSelectionsButton := self newButton
		label: 'Save selections to file';
		icon: ((self iconNamed: #smallSaveAsIcon ) "scaledToSize: 32 @ 32");
		action: [ self inform: 'Pretend this is saving the selections'"Action to save the selections to a file" ]
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
