Class {
	#name : #MLSUnserializeMethodTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSUnserializeMethodTest >> testAsMLSMethodInImage [
	| method serialized |
	serialized := (self mlsMethodFor: #sampleMethodWithLiterals2) asSerializedMethod.
	method	 := serialized asMLSMethod.

	self assert: method literalCandidates size equals: serialized literalCandidates size.
	self assert: method compiledMethod equals: MLSAbstractSerializationClassTest >> #sampleMethodWithLiterals2
]

{ #category : #tests }
MLSUnserializeMethodTest >> testAsMLSMethodUnknown [
	| method serialized |
	serialized := self fakeSerializedMethod1.
	method	 := serialized asMLSMethod.

	self assert: method class equals: MLSMethodExternal .
	self assert: method sourceCode equals: self exampleMethodBody1.
	self deny: method isTestMethod.
]

{ #category : #tests }
MLSUnserializeMethodTest >> testAsMLSMethodUnknownWithLiterals [
	| method serialized literal |
	serialized := self fakeSerializedMethod2.
	method	 := serialized asMLSMethod.

	self assert: method class equals: MLSMethodExternal .
	self assert: method literalCandidates size equals: 1.
	literal := method literalCandidates anyOne.
	self assert: literal value equals: '1'
]
