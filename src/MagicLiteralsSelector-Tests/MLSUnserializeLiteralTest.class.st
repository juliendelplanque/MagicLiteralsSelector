Class {
	#name : #MLSUnserializeLiteralTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSUnserializeLiteralTest >> testAsMLSLiteralCandidateCannotDecide [
	| literal serialized mlsMethod mlsLiteral |
	mlsMethod := self mlsMethodFor: #sampleMethodWithLiterals1.
	mlsLiteral := mlsMethod literalCandidates first.
	serialized := MLSSerializedLiteralCandidate new 
		startPosition: mlsLiteral astNode start ;
		endPosition:  mlsLiteral astNode stop ;
		status: MLSCannotDecide new ;
		yourself.
	literal	 := serialized asLiteralCandidateInAST: (mlsMethod compiledMethod) parseTree.

	self assert: literal class equals: MLSLiteralCandidate.
	self assert: literal literalValue equals: #one.
	self assert: literal isCannotDecide
]

{ #category : #tests }
MLSUnserializeLiteralTest >> testAsMLSLiteralCandidateUnknown [
	| literal serialized |
	serialized := self fakeSerializedLiteral.
	literal	 := serialized asLiteralCandidateInSourceCode: self exampleMethodBody2.

	self assert: literal class equals: MLSLiteralCandidateExternal .
	self assert: literal literalValue equals: '1'.
	self assert: literal isMagic
]
