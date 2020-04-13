Class {
	#name : #MLSUnserializeLiteralTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSUnserializeLiteralTest >> testAsMLSLiteralCandidateUnknown [
	| literal serialized |
	serialized := self fakeSerializedLiteral.
	literal	 := serialized asLiteralCandidateInSourceCode: self exampleMethodBody2.

	self assert: literal class equals: MLSLiteralCandidateExternal .
	self assert: literal value equals: '1'.
	self assert: literal isMagic
]
