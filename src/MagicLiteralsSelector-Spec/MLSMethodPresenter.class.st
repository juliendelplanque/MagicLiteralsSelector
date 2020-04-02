Class {
	#name : #MLSMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'btnBrowse',
		'sourceCodePresenter',
		'literalCandidatesPresenter',
		'explanations',
		'lblCannotDecideJustification',
		'pharoMethod'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSMethodPresenter class >> defaultSpec [
	^SpPanedLayout newVertical
		add: (SpBoxLayout newVertical
				add: #btnBrowse height: (self toolbarHeight);
				add: #sourceCodePresenter ;
				yourself) ;
	   add: (SpBoxLayout newVertical
				add: #literalCandidatesPresenter ;
				add: #explanations height: (self defaultFont height * 5) ; "why 5 since there are only 3 lines??? bug in 'defaultFont height'?"
				yourself ) ;
		yourself
]

{ #category : #initialization }
MLSMethodPresenter >> initializeExplanationsPresenter [
	explanations := self newText.
	explanations
		enabled: false ;
		text:
'Note:
  A _magic_ literal is a literal that you don''t really understand
  (Why this value? What happens if you change it?)'
	
]

{ #category : #initialization }
MLSMethodPresenter >> initializeLiteralCandidatesPresenter [
	literalCandidatesPresenter := self instantiate: MLSLiteralCandidatesPresenter.
	literalCandidatesPresenter whenLiteralCandidateSelectedChange: [ :literalCandidate | 
		literalCandidate ifNotNil: [sourceCodePresenter selectionInterval: literalCandidate positionsInterval] ].
]

{ #category : #initialization }
MLSMethodPresenter >> initializePresenters [
	self initializeSourceCodePresenter.
	self initializeLiteralCandidatesPresenter.
	self initializeExplanationsPresenter.
	
]

{ #category : #initialization }
MLSMethodPresenter >> initializeSourceCodePresenter [
	btnBrowse := self newButton
						label: 'Browse...' ;
						action: [ pharoMethod ifNotNil: [ pharoMethod browse ] ] ;
						yourself.
	sourceCodePresenter := self newCode withSyntaxHighlight ; yourself.

]

{ #category : #accessing }
MLSMethodPresenter >> method: aMethod [
	pharoMethod := aMethod compiledMethod .
	sourceCodePresenter
		behavior: aMethod methodClass;
		text: aMethod sourceCode.
	literalCandidatesPresenter literalsCandidates: aMethod literalCandidates.
	"self justificationCannotDecideEnabled: false.
	justificationTextInput text: ''"
	
]
