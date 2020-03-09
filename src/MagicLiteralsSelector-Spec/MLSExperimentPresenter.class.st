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
		icon: ((self iconNamed: #smallSaveAsIcon ));
		help: 'Saves the results of the classifications (selections) in a file';
		action: [ self saveExperimentResults ]
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

{ #category : #actions }
MLSExperimentPresenter >> saveExperimentResults [
	| fileSavedIn |
	fileSavedIn := methodsSample asSerializedMethodsSample saveInImageDirectory.
	UIManager default inform: ('Results saved in "{1}"' format: {fileSavedIn}).
]
