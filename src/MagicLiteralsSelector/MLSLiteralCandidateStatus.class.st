Class {
	#name : #MLSLiteralCandidateStatus,
	#superclass : #Object,
	#category : #MagicLiteralsSelector
}

{ #category : #testing }
MLSLiteralCandidateStatus >> isCanNotDecide [
	^ false
]

{ #category : #testing }
MLSLiteralCandidateStatus >> isMagic [
	^ false
]

{ #category : #testing }
MLSLiteralCandidateStatus >> isNotMagic [
	^ false
]

{ #category : #testing }
MLSLiteralCandidateStatus >> isUnknown [
	^ false
]
