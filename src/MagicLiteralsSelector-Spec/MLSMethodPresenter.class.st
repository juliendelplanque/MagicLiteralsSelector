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
		add:
			(SpBoxLayout newHorizontal
				add: #sourceCodePresenter;
				add: #literalCandidatesPresenter;
				yourself);
		add: 'Choice justification (in case you answered "Can not decide"):' 
			withConstraints: [ :constraints | constraints height: self labelHeight ];
		add: #justificationTextInput;
		yourself
]

{ #category : #initialization }
MLSMethodPresenter >> initializePresenters [
	sourceCodePresenter := self newCode.
	
	literalCandidatesPresenter := self instantiate: MLSLiteralCandidatesPresenter.
	
	justificationTextInput := self newText
]

{ #category : #accessing }
MLSMethodPresenter >> method: aMethod [
	sourceCodePresenter text: aMethod sourceCode.
	literalCandidatesPresenter literalsCandidates: aMethod literalsCandidates.
	
]
