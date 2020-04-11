"
A MLSSerializedMethodTest is a test class for testing the behavior of MLSSerializedMethod
"
Class {
	#name : #MLSSerializedMethodTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSSerializedMethodTest >> testAsSerializedMethod [
	| method serialized |
	method := self mlsMethodFor: #sampleMethodWithLiterals2.
	
	serialized := method asSerializedMethod.
	
	self assert: serialized methodPackageName equals: MLSAbstractSerializationClassTest package name.
	self assert: serialized methodClassName equals: #MLSAbstractSerializationClassTest.
	self assert: serialized methodSelector equals: #sampleMethodWithLiterals2.
	self assert: serialized literalCandidates size equals: method literalCandidates size.
	self assert: serialized sourceCode equals: 'sampleMethodWithLiterals2
	^{ 1 . 2 . $a }'
]
