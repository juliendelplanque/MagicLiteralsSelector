"
A MLSSerializedLiteralCandidateTest is a test class for testing the behavior of MLSSerializedLiteralCandidate
"
Class {
	#name : #MLSSerializedLiteralCandidateTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #'private - utilities' }
MLSSerializedLiteralCandidateTest >> literalCandidatesFor: aMethod [
	^(self mlsMethodFor: aMethod) literalCandidates
]

{ #category : #tests }
MLSSerializedLiteralCandidateTest >> testAsSerializedLiteralCandidate [
	| literalCandidate serialized |
	literalCandidate := (self literalCandidatesFor: #sampleMethodWithLiterals2) first.
	
	serialized := literalCandidate asSerializedLiteralCandidate.
	
	self assert: serialized status equals: literalCandidate status.
	self assert: serialized startPosition equals: 29.
	self assert: serialized endPosition equals: 42.
]
