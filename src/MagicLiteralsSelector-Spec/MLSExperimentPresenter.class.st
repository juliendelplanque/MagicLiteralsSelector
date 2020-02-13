Class {
	#name : #MLSExperimentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'methodsList',
		'methodPresenter'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSExperimentPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		spacing: 5;
		add: #methodsList;
		add: #methodPresenter;
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
		methodPresenter method: selection selectedItem ] 
]

{ #category : #accessing }
MLSExperimentPresenter >> methodsSample: aMethodsSample [
	methodsList items: aMethodsSample methods.
	
	aMethodsSample methods do: [ :m |
		m whenAnyLiteralCandidateStatusChangedDo: [ :method :literal |
			methodsList items: aMethodsSample methods. ] ]
]
