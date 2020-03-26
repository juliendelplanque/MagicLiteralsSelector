"
A MLSLiteralCandidateTest is a test class for testing the behavior of MLSLiteralCandidate
"
Class {
	#name : #MLSLiteralCandidateTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSLiteralCandidateTest >> testBeCanNotDecide [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beCanNotDecide.
	
	self assert: candidate status class equals: MLSCanNotDecide.
	self assert: candidate isCanNotDecide
]

{ #category : #tests }
MLSLiteralCandidateTest >> testBeMagic [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beMagic.
	
	self assert: candidate status class equals: MLSIsMagic.
	self assert: candidate isMagic
]

{ #category : #tests }
MLSLiteralCandidateTest >> testBeNotMagic [
	| candidate |
	candidate := MLSLiteralCandidate new.
	
	candidate beNotMagic.
	
	self assert: candidate status class equals: MLSIsNotMagic.
	self assert: candidate isNotMagic
]

{ #category : #tests }
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
	literalCandidate := (MLSMethod compiledMethod: MLSFakeClassForTesting >> #manyLiterals) literalsCandidates detect: [ :l | l literalValue = 42 ].
	
	self assert: literalCandidate positionsInterval equals: (44 to: 45)
]

{ #category : #tests }
MLSLiteralCandidateTest >> testWhenStatusChangedDo [
	| literalCandidate newStatus |
	literalCandidate := (MLSMethod compiledMethod: MLSFakeClassForTesting >> #manyLiterals) literalsCandidates detect: [ :l | l literalValue = 42 ].
	newStatus := nil.
	literalCandidate whenStatusChangedDo: [ :candidate | newStatus := candidate status ].
	
	self assert: newStatus isNil.
	
	literalCandidate beMagic.
	
	self assert: newStatus equals: literalCandidate status
]
