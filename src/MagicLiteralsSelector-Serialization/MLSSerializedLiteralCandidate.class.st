Class {
	#name : #MLSSerializedLiteralCandidate,
	#superclass : #Object,
	#instVars : [
		'status',
		'startPosition',
		'endPosition'
	],
	#category : #'MagicLiteralsSelector-Serialization-Core'
}

{ #category : #converting }
MLSSerializedLiteralCandidate >> asMLSLiteralCandidateInAST: astTree [
	| astNode |
	astNode := RBGenericNodeVisitor
		visit: astTree
		detect: [ :node| (node start = startPosition) and: [ node stop = endPosition ] ].
	^MLSLiteralCandidate new
		astNode: astNode ;
		status: status ;
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
