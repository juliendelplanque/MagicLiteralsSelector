Class {
	#name : #MLSMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'btnBrowse',
		'sourceCodePresenter',
		'literalCandidatesPresenter',
		'justificationTextInput',
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
		"add: (SpPanedLayout newVertical"
				add: #literalCandidatesPresenter ;
				"add: (SpBoxLayout newVertical
						add: #lblCannotDecideJustification expand: false ;
						add: #justificationTextInput ;
						yourself);
				yourself ) ;"
		yourself
]

{ #category : #initialization }
MLSMethodPresenter >> initializeLiteralCandidatesPresenter [
	literalCandidatesPresenter := self instantiate: MLSLiteralCandidatesPresenter.
	literalCandidatesPresenter whenLiteralCandidateSelectedChange: [ :literalCandidate | 
		literalCandidate ifNotNil: [sourceCodePresenter selectionInterval: literalCandidate positionsInterval] ].
	"literalCandidatesPresenter whenLiteralCandidateStatusChange: [ :literalCandidate |
		self justificationCannotDecideEnabled: literalCandidate isCanNotDecide. ]"
	
]

{ #category : #initialization }
MLSMethodPresenter >> initializePresenters [
	self initializeSourceCodePresenter.
	self initializeLiteralCandidatesPresenter.
	"self initializejustificationPresenter."
	
]

{ #category : #initialization }
MLSMethodPresenter >> initializeSourceCodePresenter [
	btnBrowse := self newButton
						label: 'Browse...' ;
						action: [ pharoMethod ifNotNil: [ pharoMethod browse ] ] ;
						yourself.
	sourceCodePresenter := self newCode withSyntaxHighlight ; yourself.

]

{ #category : #initialization }
MLSMethodPresenter >> initializejustificationPresenter [
	lblCannotDecideJustification := self newLabel
		label: 'Choice justification (in case you answered "Can not decide"):' ;
		enabled: false ;
		yourself.
	justificationTextInput := self newText.
	justificationTextInput enabled: false. 
	self initializeLiteralCandidatesPresenter
	
]

{ #category : #initialization }
MLSMethodPresenter >> justificationCannotDecideEnabled: aBoolean [
	justificationTextInput enabled: aBoolean.
	lblCannotDecideJustification enabled: aBoolean
	
]

{ #category : #accessing }
MLSMethodPresenter >> method: aMethod [
	pharoMethod := aMethod compiledMethod .
	sourceCodePresenter
		behavior: aMethod methodClass;
		text: aMethod sourceCode.
	literalCandidatesPresenter literalsCandidates: aMethod literalsCandidates.
	"self justificationCannotDecideEnabled: false.
	justificationTextInput text: ''"
	
]
