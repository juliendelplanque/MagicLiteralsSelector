Class {
	#name : #MLSMethodListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'lblMethodCount',
		'methodsList',
		'methodsSample',
		'chkHideCompleted'
	],
	#category : #'MagicLiteralsSelector-Spec'
}

{ #category : #specs }
MLSMethodListPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
					add: #lblMethodCount width: 200 ;
					add: #chkHideCompleted ;
					yourself)
		withConstraints: [ :constraints | constraints height: self toolbarHeight ] ;
		add: #methodsList ;
		yourself
]

{ #category : #updating }
MLSMethodListPresenter >> hideCompletedMethods [
	methodsList items: (methodsSample reject: #isCompleted) asOrderedCollection.
	self updateLabel 
]

{ #category : #initialization }
MLSMethodListPresenter >> initialize [
	super initialize.
	methodsSample := MLSMethodsSample new
]

{ #category : #initialization }
MLSMethodListPresenter >> initializePresenters [
	chkHideCompleted :=
		self newCheckBox
			label: 'Hide completed' ;
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
	methodsList items: aMethodsSample.
	self update.

	aMethodsSample methods do: [ :m |
		m whenAnyLiteralCandidateStatusChangedDo: [ :method :literal |
			self update ] ]
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
	methodsList items: methodsSample asOrderedCollection.
	self updateLabel 
]

{ #category : #updating }
MLSMethodListPresenter >> update [	
	chkHideCompleted state
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
