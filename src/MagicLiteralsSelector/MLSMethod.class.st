"
I model a method to be presented to the user for checking literals.

I wrap a compiled method available in the system and provide additional state such as the list of literal candidates.

I allow one to be notified when the status of any of my literal candidate is updated via #whenAnyLiteralCandidateStatusChangedDo: method.
"
Class {
	#name : #MLSMethod,
	#superclass : #Object,
	#instVars : [
		'compiledMethod',
		'literalsCandidates',
		'anyLiteralCandidateStatusChangedBlock'
	],
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSMethod class >> compiledMethod: aCompiledMethod [
	^ self new
		compiledMethod: aCompiledMethod;
		yourself
]

{ #category : #converting }
MLSMethod >> asSerializedMethod [
	^ MLSSerializedMethod new
		methodPackageName: self compiledMethod package name;
		methodClassName: self methodClass name;
		methodSelector: self compiledMethod selector;
		sourceCode: self compiledMethod sourceCode;
		literalCandidates: (self literalCandidates collect: #asSerializedLiteralCandidate);
		yourself
]

{ #category : #accessing }
MLSMethod >> comments [
	^ self compiledMethod comments
]

{ #category : #accessing }
MLSMethod >> compiledMethod [
	^ compiledMethod
]

{ #category : #accessing }
MLSMethod >> compiledMethod: anObject [
	compiledMethod := anObject
]

{ #category : #accessing }
MLSMethod >> completionStatusIcon [
	^ self isCompleted
		ifTrue: [ #glamorousAccept ]
		ifFalse: [ #flag ]
]

{ #category : #displaying }
MLSMethod >> displayStringOn: aStream [
	^ self compiledMethod displayStringOn: aStream
]

{ #category : #private }
MLSMethod >> gatherLiteralsCandidates [
	^ literalsCandidates := self gatherRBLiteralsNodes
		collect: [ :n | 
			(MLSLiteralCandidate astNode: n)
				whenStatusChangedDo: [ :literalCandidate | anyLiteralCandidateStatusChangedBlock cull: self cull: literalCandidate ];
				yourself ]
]

{ #category : #private }
MLSMethod >> gatherRBLiteralsNodes [
	^ MLSFindLiteralsNodeVisitor visit: (compiledMethod parseTree)
]

{ #category : #testing }
MLSMethod >> hasBooleanLiteral [
	^self hasLiteral: #isBooleanLiteral 
]

{ #category : #testing }
MLSMethod >> hasCharacterLiteral [
	^self hasLiteral: #isCharacterLiteral 
]

{ #category : #accessing }
MLSMethod >> hasComment [
	^ self comments notEmpty
]

{ #category : #testing }
MLSMethod >> hasDuplicate [
	^(literalsCandidates groupedBy: #literalValue)
		anySatisfy: [ :l | l size > 1 ]
]

{ #category : #testing }
MLSMethod >> hasFloatLiteral [
	^self hasLiteral: #isFloatLiteral 
]

{ #category : #testing }
MLSMethod >> hasIntegerLiteral [
	^self hasLiteral: #isIntegerLiteral 
]

{ #category : #testing }
MLSMethod >> hasLiteral: aSymbol [ 
	^self literalCandidates anySatisfy: aSymbol
]

{ #category : #testing }
MLSMethod >> hasLiterals [
	^self literalCandidates notEmpty
]

{ #category : #testing }
MLSMethod >> hasNilLiteral [
	^self hasLiteral: #isNilLiteral 
]

{ #category : #testing }
MLSMethod >> hasStringLiteral [
	^self hasLiteral: #isStringLiteral 
]

{ #category : #testing }
MLSMethod >> hasSymbolLiteral [
	^self hasLiteral: #isSymbolLiteral 
]

{ #category : #initialization }
MLSMethod >> initialize [
	super initialize.
	anyLiteralCandidateStatusChangedBlock := [ :method :literalCandidate | ]
]

{ #category : #testing }
MLSMethod >> isCompleted [
	^ self literalCandidates noneSatisfy: [ :candidate |
		candidate status isUnknown ]
]

{ #category : #testing }
MLSMethod >> isTestMethod [
	^ self compiledMethod isTestMethod
]

{ #category : #accessing }
MLSMethod >> literalCandidates [
	^ literalsCandidates ifNil: [ literalsCandidates := self gatherLiteralsCandidates ]
]

{ #category : #accessing }
MLSMethod >> literalCandidates: aCollection [
	^ literalsCandidates := aCollection 
]

{ #category : #accessing }
MLSMethod >> methodClass [
	^ self compiledMethod methodClass
]

{ #category : #printing }
MLSMethod >> printOn: aStream [
	self compiledMethod printOn: aStream
	
]

{ #category : #accessing }
MLSMethod >> sourceCode [
	^ self compiledMethod sourceCode
]

{ #category : #api }
MLSMethod >> whenAnyLiteralCandidateStatusChangedDo: aBlock [
	anyLiteralCandidateStatusChangedBlock := aBlock
]
