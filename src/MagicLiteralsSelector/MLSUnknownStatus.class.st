"
I model the fact that a user did classified a literal candidate yet.

In fact, I implement the null object design pattern for literal candidate status.
When a new literal candidate is instantiated, its status inst. var. is set to be an instance of me.
"
Class {
	#name : #MLSUnknownStatus,
	#superclass : #MLSLiteralCandidateStatus,
	#category : #MagicLiteralsSelector
}

{ #category : #testing }
MLSUnknownStatus >> isUnknown [
	^ true
]
