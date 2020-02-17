"
I model the fact that a user decided that the literal candidate is magic.
"
Class {
	#name : #MLSIsMagic,
	#superclass : #MLSLiteralCandidateStatus,
	#category : #MagicLiteralsSelector
}

{ #category : #testing }
MLSIsMagic >> isMagic [
	^ true
]
