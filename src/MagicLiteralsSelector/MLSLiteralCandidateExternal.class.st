"
Fallback solution to represent a MLSLiteralCandidate that was exported from another image and whose method could not be found in the current image
"
Class {
	#name : #MLSLiteralCandidateExternal,
	#superclass : #MLSLiteralCandidate,
	#instVars : [
		'serializedCandidate',
		'value'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

{ #category : #converting }
MLSLiteralCandidateExternal >> literalValue [
	^value
]

{ #category : #converting }
MLSLiteralCandidateExternal >> positionsInterval [
	^ serializedCandidate startPosition
		to: serializedCandidate endPosition
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> serializedCandidate: anObject [
	serializedCandidate := anObject
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> status [
	^serializedCandidate status
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> value [
	^value
]

{ #category : #accessing }
MLSLiteralCandidateExternal >> value: anObject [
	value := anObject
]
