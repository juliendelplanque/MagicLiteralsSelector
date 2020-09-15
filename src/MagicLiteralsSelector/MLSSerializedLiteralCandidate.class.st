"
Serialized version of an MLSCandidate
Does not contain the AST node of the literal, but its position in the method source
"
Class {
	#name : #MLSSerializedLiteralCandidate,
	#superclass : #Object,
	#instVars : [
		'status',
		'kind',
		'startPosition',
		'endPosition'
	],
	#category : #'MagicLiteralsSelector-serialization'
}

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
MLSSerializedLiteralCandidate >> kind [
	^ kind
]

{ #category : #accessing }
MLSSerializedLiteralCandidate >> kind: anObject [
	kind := anObject
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
