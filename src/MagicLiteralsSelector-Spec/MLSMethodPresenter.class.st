Class {
	#name : #MLSMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'sourceCodePresenter',
		'literalCandidatesPresenter',
		'justificationTextInput'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSMethodPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		spacing: 5;
		add: #sourceCodePresenter;
		add: #literalCandidatesPresenter height: (self inputTextHeight * 2) ;
		add: 'Choice justification (in case you answered "Can not decide"):' expand: false;
		add: #justificationTextInput height: (self inputTextHeight * 3);
		yourself
]

{ #category : #initialization }
MLSMethodPresenter >> initializePresenters [
	sourceCodePresenter := self newCode.
	justificationTextInput := self newText.
	justificationTextInput enabled: false. 
	
	literalCandidatesPresenter := self instantiate: MLSLiteralCandidatesPresenter.
	literalCandidatesPresenter whenLiteralCandidateSelectedChange: [ :literalCandidate | 
		sourceCodePresenter selectionInterval: literalCandidate positionsInterval ].
	literalCandidatesPresenter whenLiteralCandidateStatusChange: [ :literalCandidate |
		justificationTextInput enabled: literalCandidate isCanNotDecide ]
	
]

{ #category : #accessing }
MLSMethodPresenter >> method: aMethod [
	sourceCodePresenter
		behavior: aMethod methodClass;
		text: aMethod sourceCode.
	literalCandidatesPresenter literalsCandidates: aMethod literalsCandidates.
	
]
