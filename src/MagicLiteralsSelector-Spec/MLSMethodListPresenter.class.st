Class {
	#name : #MLSMethodListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'chkOnlyCompleted',
		'lblMethodCount',
		'methodsList',
		'methodsSample'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSMethodListPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
					add: #lblMethodCount width: 200 ;
					add: #chkOnlyCompleted ;
					yourself)
		withConstraints: [ :constraints | constraints height: self toolbarHeight ] ;
		add: #methodsList ;
		yourself
]

{ #category : #updating }
MLSMethodListPresenter >> hideCompletedMethods [
	methodsList items: (methodsSample methods reject: #isCompleted).
	self updateLabel 
]

{ #category : #initialization }
MLSMethodListPresenter >> initialize [
	super initialize.
	methodsSample := MLSMethodsSample new
]

{ #category : #initialization }
MLSMethodListPresenter >> initializePresenters [
	chkOnlyCompleted :=
		self newCheckBox
			label: 'Hide completed methods' ;
			labelOnRight ;
			state: false;
			whenActivatedDo: [ self hideCompletedMethods ];
			whenDeactivatedDo: [ self showCompletedMethods ];
			yourself.
			
	lblMethodCount := self newLabel.
	self updateLabel.

	methodsList := self newList.
	methodsList
		display: [ :m | m displayString ];
		icons: [ :m | self iconNamed: m completionStatusIcon ].

]

{ #category : #accessing }
MLSMethodListPresenter >> methodsSample: aMethodsSample [
	methodsSample := aMethodsSample.
	methodsList items: aMethodsSample methods.
	self update.

	aMethodsSample methods do: [ :m |
		m whenAnyLiteralCandidateStatusChangedDo: [ :method :literal |
			"self update" ] ]
]

{ #category : #accessing }
MLSMethodListPresenter >> nbMethodsShown [
	^ methodsList ifNil: [ 0 ] ifNotNil: [methodsList listSize]
]

{ #category : #accessing }
MLSMethodListPresenter >> nbMethodsTotal [
	^ methodsSample ifNil: [ 0 ] ifNotNil: [methodsSample methods size]
]

{ #category : #updating }
MLSMethodListPresenter >> showCompletedMethods [
	methodsList items: methodsSample methods.
	self updateLabel 
]

{ #category : #updating }
MLSMethodListPresenter >> update [	
	chkOnlyCompleted state
	ifTrue:  [ self hideCompletedMethods ]
	ifFalse: [ self showCompletedMethods ].

	self updateLabel
]

{ #category : #updating }
MLSMethodListPresenter >> updateLabel [
	lblMethodCount label: (' Showing ' , self nbMethodsShown asString , ' of ' , self nbMethodsTotal asString , ' methods')
]

{ #category : #events }
MLSMethodListPresenter >> whenSelectionChangedDo: aBlock [
	^ methodsList whenSelectionChangedDo: aBlock
]
