"
A MLSSerializedMethodsSampleTest is a test class for testing the behavior of MLSSerializedMethodsSample
"
Class {
	#name : #MLSSerializedMethodsSampleTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSSerializedMethodsSampleTest >> testAsSerializedMethodsSample [
	| sample serialized |
	sample := MLSMethodsSample methods: { 
					self mlsMethodFor: #sampleMethodWithLiterals1.
					self mlsMethodFor: #sampleMethodWithLiterals2 }.
	
	serialized := sample asSerializedMethodsSample.
	
	self assert: serialized methods size equals: 2
]
