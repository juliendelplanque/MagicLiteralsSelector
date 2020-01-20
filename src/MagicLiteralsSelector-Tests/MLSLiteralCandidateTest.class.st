"
A MLSLiteralCandidateTest is a test class for testing the behavior of MLSLiteralCandidate
"
Class {
	#name : #MLSLiteralCandidateTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #test }
MLSLiteralCandidateTest >> testBeCanNotDecide [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beCanNotDecide.
	
	self assert: candidate status class equals: MLSCanNotDecide.
	self assert: candidate isCanNotDecide
]

{ #category : #test }
MLSLiteralCandidateTest >> testBeMagic [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beMagic.
	
	self assert: candidate status class equals: MLSIsMagic.
	self assert: candidate isMagic
]

{ #category : #test }
MLSLiteralCandidateTest >> testBeNotMagic [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beNotMagic.
	
	self assert: candidate status class equals: MLSIsNotMagic.
	self assert: candidate isNotMagic
]

{ #category : #test }
MLSLiteralCandidateTest >> testBeUnknown [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beUnknown.
	
	self assert: candidate status class equals: MLSUnknownStatus.
	self assert: candidate isUnknown
]

{ #category : #tests }
MLSLiteralCandidateTest >> testCandidateHasUnknownStatusAfterInstantiation [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	self assert: candidate isUnknown
]

{ #category : #tests }
MLSLiteralCandidateTest >> testPositionsInterval [
	| literalCandidate |
	literalCandidate := (MLSMethod compiledMethod: MLSMethodTest >> #sampleMethodWithLiterals) literalsCandidates detect: [ :l | l literalValue = 42 ].
	
	self assert: literalCandidate positionsInterval equals: (40 to: 41)
]
