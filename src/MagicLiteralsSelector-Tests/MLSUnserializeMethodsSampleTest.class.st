Class {
	#name : #MLSUnserializeMethodsSampleTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSUnserializeMethodsSampleTest >> testAsMethodsSample [
	| sample serialized |
	serialized := MLSSerializedMethodsSample new
		name: 'test sample' ;
		methods: { 
			self fakeSerializedMethod1 .
			self fakeSerializedMethod2 }.
	
	sample := serialized asMethodsSample.
	
	self assert: sample methods size equals: 2.
	self assert: sample name equals: 'test sample'.
]
