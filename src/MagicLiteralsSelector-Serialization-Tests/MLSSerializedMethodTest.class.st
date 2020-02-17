"
A MLSSerializedMethodTest is a test class for testing the behavior of MLSSerializedMethod
"
Class {
	#name : #MLSSerializedMethodTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSSerializedMethodTest >> testAsSerializedMethod [
	| method serialized |
	method := MLSMethod compiledMethod: MLSFakeClassForTestingPurpose>>#sampleMethodWithLiterals2.
	
	serialized := method asSerializedMethod.
	
	self assert: serialized methodPackageName equals: MLSFakeClassForTestingPurpose package name.
	self assert: serialized methodClassName equals: #MLSFakeClassForTestingPurpose.
	self assert: serialized methodSelector equals: #sampleMethodWithLiterals2.
	self assert: serialized literalCandidates size equals: method literalsCandidates size.
	self assert: serialized sourceCode equals: 'sampleMethodWithLiterals2
	^{ 1 . 2 . $a }'
]
