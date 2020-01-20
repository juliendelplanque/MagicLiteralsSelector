"
I model a method to be presented to the user for checking literals.
"
Class {
	#name : #MLSMethod,
	#superclass : #Object,
	#category : #MagicLiteralsSelector
}

{ #category : #api }
MLSMethod >> literalsCandidates [
	^ self shouldBeImplemented
]
