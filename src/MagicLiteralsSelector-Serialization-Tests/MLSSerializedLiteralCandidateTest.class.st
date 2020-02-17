"
A MLSSerializedLiteralCandidateTest is a test class for testing the behavior of MLSSerializedLiteralCandidate
"
Class {
	#name : #MLSSerializedLiteralCandidateTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSSerializedLiteralCandidateTest >> testAsSerializedLiteralCandidate [
	| literalCandidate serialized |
	literalCandidate := (MLSMethod compiledMethod: MLSFakeClassForTestingPurpose>>#sampleMethodWithLiterals2) literalsCandidates first.
	
	serialized := literalCandidate asSerializedLiteralCandidate.
	
	self assert: serialized status equals: literalCandidate status.
	self assert: serialized startPosition equals: 31.
	self assert: serialized endPosition equals: 31.
]

{ #category : #tests }
MLSSerializedLiteralCandidateTest >> testAsSerializedLiteralCandidate2 [
	| literalCandidate serialized |
	literalCandidate := (MLSMethod compiledMethod: MLSFakeClassForTestingPurpose>>#sampleMethodWithLiterals2) literalsCandidates second.
	literalCandidate beMagic.
	serialized := literalCandidate asSerializedLiteralCandidate.
	
	self assert: serialized status equals: literalCandidate status.
	self assert: serialized startPosition equals: 35.
	self assert: serialized endPosition equals: 35.
]
