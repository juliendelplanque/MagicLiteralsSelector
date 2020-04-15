Class {
	#name : #MLSUnserializeToAnalysisMethodTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSUnserializeToAnalysisMethodTest >> testInImageAsAnalysisMethod [
	| method serialized |
	serialized := MLSSerializedMethod new
		methodPackageName: 'MagicLiteralsSelector-Tests-serialization' ;
		methodClassName: 'MLSAbstractSerializationClassTest' ;
		methodSelector: #sampleMethodWithLiterals2 ;
		sourceCode: 'some code' ;
		literalCandidates: #() ;
		yourself.
	method	 := serialized asAnalysisMethod.

	self assert: method literals size equals: 0.
	self
		assert: method sourceCode
		equals: 'some code'
]

{ #category : #tests }
MLSUnserializeToAnalysisMethodTest >> testUnknownAsAnalysisMethod [
	| method  |
	method	 := self fakeSerializedMethod1 asAnalysisMethod.

	self assert: method literals size equals: 0.
	self
		assert: method sourceCode
		equals: self exampleMethodBody1
]
