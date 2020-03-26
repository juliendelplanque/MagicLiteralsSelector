"
I model the fact that a user can not decide whether the literal candidate is magic or not.
"
Class {
	#name : #MLSCanNotDecide,
	#superclass : #MLSLiteralCandidateStatus,
	#instVars : [
		'justification'
	],
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #testing }
MLSCanNotDecide >> isCanNotDecide [
	^ true
]

{ #category : #accessing }
MLSCanNotDecide >> justification [
	^ justification
]

{ #category : #accessing }
MLSCanNotDecide >> justification: anObject [
	justification := anObject
]
