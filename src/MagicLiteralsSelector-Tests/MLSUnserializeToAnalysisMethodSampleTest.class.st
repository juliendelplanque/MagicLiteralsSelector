Class {
	#name : #MLSUnserializeToAnalysisMethodSampleTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSUnserializeToAnalysisMethodSampleTest >> testAsSampleAnalysis [
	| sample serialized |
	serialized := MLSSerializedMethodsSample new
		name: 'test sample' ;
		methods: { 
			self fakeSerializedMethod1 .
			self fakeSerializedMethod2 }.
	
	sample := serialized asSampleAnalysis.
	
	self assert: sample methods size equals: 2.
	self assert: sample name equals: 'test sample'.
]