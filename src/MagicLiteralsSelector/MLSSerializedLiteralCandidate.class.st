"
Serialized version of an MLSCandidate
Does not contain the AST node of the literal, but its position in the method source
"
Class {
	#name : #MLSSerializedLiteralCandidate,
	#superclass : #Object,
	#instVars : [
		'status',
		'startPosition',
		'endPosition'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #converting }
MLSSerializedLiteralCandidate >> asAnalysisLiteralInMethod: aMethod [
	^MLSAnalysisLiteral new
		method: aMethod ;
		value: (self valueInSourceCode: aMethod sourceCode) ;
		status: status ;
		yourself
]

{ #category : #converting }
MLSSerializedLiteralCandidate >> asLiteralCandidateInAST: astTree [
	| astNode |
	astNode := RBGenericNodeVisitor
		visit: astTree
		detect: [ :node| (node start = startPosition) and: [ node stop = endPosition ] ].
	^MLSLiteralCandidate new
		astNode: astNode ;
		status: status ;
		yourself
]

{ #category : #converting }
MLSSerializedLiteralCandidate >> asLiteralCandidateInSourceCode: aString [
	^MLSLiteralCandidateExternal new
		serializedCandidate: self ;
		value: (self valueInSourceCode: aString) ;
		yourself
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> endPosition [
	^ endPosition
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> endPosition: anObject [
	endPosition := anObject
]

{ #category : #converting }
MLSSerializedLiteralCandidate >> fixStonErrors [
	"correct ston issues in CanNotDecide statuses"
	status isDictionary
	ifTrue: [ self status: MLSCannotDecide new ]
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> startPosition [
	^ startPosition
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> startPosition: anObject [
	startPosition := anObject
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> status [
	^ status
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> status: anObject [
	status := anObject
]

{ #category : #converting }
MLSSerializedLiteralCandidate >> valueInSourceCode: aString [
	^aString copyFrom: startPosition to: endPosition
]
