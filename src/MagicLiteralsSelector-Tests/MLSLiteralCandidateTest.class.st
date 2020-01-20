"
A MLSLiteralCandidateTest is a test class for testing the behavior of MLSLiteralCandidate
"
Class {
	#name : #MLSLiteralCandidateTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSLiteralCandidateTest >> testPositionsInterval [
	| literalCandidate |
	literalCandidate := (MLSMethod compiledMethod: MLSMethodTest >> #sampleMethodWithLiterals) literalsCandidates detect: [ :l | l literalValue = 42 ].
	
	self assert: literalCandidate positionsInterval equals: (40 to: 41)
]
