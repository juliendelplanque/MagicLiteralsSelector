"
I model the fact that a user decided that the literal candidate is not magic.
"
Class {
	#name : #MLSIsNotMagic,
	#superclass : #MLSLiteralCandidateStatus,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #converting }
MLSIsNotMagic >> asString [
	^'notMagic'
]

{ #category : #testing }
MLSIsNotMagic >> isNotMagic [
	^ true
]
