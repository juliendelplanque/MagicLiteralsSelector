"
A MLSSerializedLiteralCandidateTest is a test class for testing the behavior of MLSSerializedLiteralCandidate
"
Class {
	#name : #MLSSerializedLiteralCandidateTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #'private - utilities' }
MLSSerializedLiteralCandidateTest >> literalCandidatesFor: aMethod [
	^(MLSMethod compiledMethod: MLSFakeClassForTestingSerialization >> aMethod) literalsCandidates
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
