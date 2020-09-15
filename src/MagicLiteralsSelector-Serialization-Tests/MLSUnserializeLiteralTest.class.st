Class {
	#name : #MLSUnserializeLiteralTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSUnserializeLiteralTest >> testAsMLSLiteralCandidateUnknown [
	| literal serialized |
	serialized := self fakeSerializedLiteral.
	literal	 := serialized asMLSLiteralCandidateInSourceCode: self exampleMethodBody2.

	self assert: literal class equals: MLSLiteralCandidateExternal .
	self assert: literal value equals: '1'.
	self assert: literal isMagic
]
