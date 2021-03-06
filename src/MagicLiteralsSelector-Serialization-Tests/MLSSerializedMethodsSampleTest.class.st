"
A MLSSerializedMethodsSampleTest is a test class for testing the behavior of MLSSerializedMethodsSample
"
Class {
	#name : #MLSSerializedMethodsSampleTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSSerializedMethodsSampleTest >> testAsSerializedMethodsSample [
	| sample serialized |
	sample := MLSMethodsSample methods: { 
					MLSMethod compiledMethod: MLSFakeClassForTestingPurpose>>#sampleMethodWithLiterals1.
					MLSMethod compiledMethod: MLSFakeClassForTestingPurpose>>#sampleMethodWithLiterals2 }.
	
	serialized := sample asSerializedMethodsSample.
	
	self assert: serialized methods size equals: 2
]
