"
I am an abstract class modeling the status of a literal candidate during the experiment.
My subclasses implement concrete statuses.

My subclasses allow one to store the classification made by a user for a specific candidate (e.g. it is magic, it is not magic, ...).
"
Class {
	#name : #MLSLiteralCandidateStatus,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #converting }
MLSLiteralCandidateStatus >> asString [
	self subclassResponsibility 
]

{ #category : #testing }
MLSLiteralCandidateStatus >> isCannotDecide [
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
