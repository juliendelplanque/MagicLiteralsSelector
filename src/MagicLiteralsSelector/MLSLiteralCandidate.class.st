"
I am wrapping a literal AST node to be checked by the user.
I hold the data related to categorisation made by the user (e.g. I am a magic literal, I am not, etc...).
"
Class {
	#name : #MLSLiteralCandidate,
	#superclass : #Object,
	#traits : 'TObservable',
	#classTraits : 'TObservable classTrait',
	#instVars : [
		'#astNode',
		'#status => ObservableSlot',
		'#statusChangedBlock'
	],
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralCandidate class >> astNode: aLiteralASTNode [
	^ self new
		astNode: aLiteralASTNode;
		yourself
]

{ #category : #converting }
MLSLiteralCandidate >> asSerializedLiteralCandidate [
	^ MLSSerializedLiteralCandidate new
		status: self status;
		startPosition: self astNode start;
		endPosition: self astNode stop;
		yourself
]

{ #category : #accessing }
MLSLiteralCandidate >> astNode [
	^ astNode
]

{ #category : #accessing }
MLSLiteralCandidate >> astNode: anObject [
	astNode := anObject
]

{ #category : #'status setting' }
MLSLiteralCandidate >> beCanNotDecide [
	self status: MLSCannotDecide new
]

{ #category : #'status setting' }
MLSLiteralCandidate >> beMagic [
	self status: MLSIsMagic new
]

{ #category : #'status setting' }
MLSLiteralCandidate >> beNotMagic [
	self status: MLSIsNotMagic new
]

{ #category : #'status setting' }
MLSLiteralCandidate >> beUnknown [
	self status: MLSUnknownStatus new
]

{ #category : #initialization }
MLSLiteralCandidate >> initialize [
	
	self class initializeSlots: self.
	super initialize.
	self beUnknown.
	
	statusChangedBlock := [ :candidate | ].
	self property: #status whenChangedDo: [ statusChangedBlock cull: self ]
]

{ #category : #testing }
MLSLiteralCandidate >> isBooleanLiteral [
	^(self literalValue = true) or: [ self literalValue = false ]

]

{ #category : #testing }
MLSLiteralCandidate >> isCannotDecide [
	^ self status isCannotDecide
]

{ #category : #testing }
MLSLiteralCandidate >> isCharacterLiteral [
	^self literalValue isCharacter
]

{ #category : #testing }
MLSLiteralCandidate >> isFloatLiteral [
	^self literalValue isFloat 
]

{ #category : #testing }
MLSLiteralCandidate >> isIntegerLiteral [
	^self literalValue isInteger 
]

{ #category : #testing }
MLSLiteralCandidate >> isMagic [
	^ self status isMagic
]

{ #category : #testing }
MLSLiteralCandidate >> isNilLiteral [
	^self literalValue isNil
]

{ #category : #testing }
MLSLiteralCandidate >> isNotMagic [
	^ self status isNotMagic
]

{ #category : #testing }
MLSLiteralCandidate >> isStringLiteral [
	^self literalValue isString
]

{ #category : #testing }
MLSLiteralCandidate >> isSymbolLiteral [
	^self literalValue isSymbol
]

{ #category : #testing }
MLSLiteralCandidate >> isUnknown [
	^ self status isUnknown
]

{ #category : #accessing }
MLSLiteralCandidate >> literalValue [
	^ self value
]

{ #category : #accessing }
MLSLiteralCandidate >> positionsInterval [
	^ self astNode start to: self astNode stop
]

{ #category : #accessing }
MLSLiteralCandidate >> status [
	^ status
]

{ #category : #accessing }
MLSLiteralCandidate >> status: anObject [
	status := anObject
]

{ #category : #accessing }
MLSLiteralCandidate >> value [
	^ self astNode value
]

{ #category : #events }
MLSLiteralCandidate >> whenStatusChangedDo: aBlock [
	statusChangedBlock := aBlock
]
