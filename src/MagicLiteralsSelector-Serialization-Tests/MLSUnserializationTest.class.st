Class {
	#name : #MLSUnserializationTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSUnserializationTest >> testAsMLSLiteralCandidateUnknown [
	| literal serialized |
	serialized := self fakeSerializedLiteral.
	literal	 := serialized asMLSLiteralCandidateInSourceCode: self exampleMethodBody2.

	self assert: literal class equals: MLSLiteralCandidateExternal .
	self assert: literal value equals: '1'.
	self assert: literal isMagic
]

{ #category : #tests }
MLSUnserializationTest >> testAsMLSMethodInImage [
	| method serialized |
	serialized := (self mlsMethodFor: #sampleMethodWithLiterals2) asSerializedMethod.
	method	 := serialized asMLSMethod.

	self assert: method literalCandidates size equals: serialized literalCandidates size.
	self assert: method compiledMethod equals: MLSAbstractSerializationClassTest >> #sampleMethodWithLiterals2
]

{ #category : #tests }
MLSUnserializationTest >> testAsMLSMethodUnknown [
	| method serialized |
	serialized := self fakeSerializedMethod1.
	method	 := serialized asMLSMethod.

	self assert: method class equals: MLSMethodExternal .
	self assert: method sourceCode equals: self exampleMethodBody1.
	self deny: method isTestMethod.
]

{ #category : #tests }
MLSUnserializationTest >> testAsMLSMethodUnknownWithLiterals [
	| method serialized literal |
	serialized := self fakeSerializedMethod2.
	method	 := serialized asMLSMethod.

	self assert: method class equals: MLSMethodExternal .
	self assert: method literalCandidates size equals: 1.
	literal := method literalCandidates anyOne.
	self assert: literal value equals: '1'
]
