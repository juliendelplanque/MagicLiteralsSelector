Class {
	#name : #MLSMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'sourceCodePresenter',
		'literalCandidatesPresenter',
		'justificationTextInput',
		'lblCannotDecideJustification'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSMethodPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		spacing: 5;
		add: #sourceCodePresenter;
		add: #literalCandidatesPresenter
			withConstraints: [ :constraints | 
				constraints
					expand: true ;
					height: (self inputTextHeight * 2) ] ;
		add: #lblCannotDecideJustification expand: false ;
		add: #justificationTextInput height: (self inputTextHeight * 3);
		yourself
]

{ #category : #initialization }
MLSMethodPresenter >> initializePresenters [
	sourceCodePresenter := self newCode.
	lblCannotDecideJustification := self newLabel
		label: 'Choice justification (in case you answered "Can not decide"):' ;
		enabled: false ;
		yourself.
	justificationTextInput := self newText.
	justificationTextInput enabled: false. 
	
	literalCandidatesPresenter := self instantiate: MLSLiteralCandidatesPresenter.
	literalCandidatesPresenter whenLiteralCandidateSelectedChange: [ :literalCandidate | 
		sourceCodePresenter selectionInterval: literalCandidate positionsInterval ].
	literalCandidatesPresenter whenLiteralCandidateStatusChange: [ :literalCandidate |
		self justificationCannotDecideEnabled: literalCandidate isCanNotDecide. ]
	
]

{ #category : #initialization }
MLSMethodPresenter >> justificationCannotDecideEnabled: aBoolean [
	justificationTextInput enabled: aBoolean.
	lblCannotDecideJustification enabled: aBoolean
	
]

{ #category : #accessing }
MLSMethodPresenter >> method: aMethod [
	sourceCodePresenter
		behavior: aMethod methodClass;
		text: aMethod sourceCode.
	literalCandidatesPresenter literalsCandidates: aMethod literalsCandidates.
	self justificationCannotDecideEnabled: false.
	justificationTextInput text: ''
	
]
