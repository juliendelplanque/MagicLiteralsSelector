Class {
	#name : #MLSLiteralCandidateExternal,
	#superclass : #MLSLiteralCandidate,
	#instVars : [
		'serializedCandidate',
		'value'
	],
	#category : #'MagicLiteralsSelector-Serialization-Core'
}

{ #category : #converting }
MLSLiteralCandidateExternal >> literalValue [
	^value
]

{ #category : #converting }
MLSLiteralCandidateExternal >> positionsInterval [
	^ serializedCandidate startPosition to: serializedCandidate endPosition
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> serializedCandidate: anObject [
	serializedCandidate := anObject
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> value [
	^value
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> value: anObject [
	value := anObject
]
