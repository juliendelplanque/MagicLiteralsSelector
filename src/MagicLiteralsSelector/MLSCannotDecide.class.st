"
I model the fact that a user can not decide whether the literal candidate is magic or not.
"
Class {
	#name : #MLSCannotDecide,
	#superclass : #MLSLiteralCandidateStatus,
	#instVars : [
		'justification'
	],
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #converting }
MLSCannotDecide >> asString [
	^'undecidedStatus'
]

{ #category : #testing }
MLSCannotDecide >> isCannotDecide [
	^ true
]

{ #category : #accessing }
MLSCannotDecide >> justification [
	^ justification
]

{ #category : #accessing }
MLSCannotDecide >> justification: anObject [
	justification := anObject
]
