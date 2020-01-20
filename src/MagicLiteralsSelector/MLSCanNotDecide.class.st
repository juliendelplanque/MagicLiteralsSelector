Class {
	#name : #MLSCanNotDecide,
	#superclass : #MLSLiteralCandidateStatus,
	#instVars : [
		'justification'
	],
	#category : #MagicLiteralsSelector
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
