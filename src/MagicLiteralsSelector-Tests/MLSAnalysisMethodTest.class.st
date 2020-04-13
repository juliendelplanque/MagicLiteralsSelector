Class {
	#name : #MLSAnalysisMethodTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-analysis'
}

{ #category : #tests }
MLSAnalysisMethodTest >> testInImageAsAnalysisMethod [
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
MLSAnalysisMethodTest >> testUnknownAsAnalysisMethod [
	| method  |
	method	 := self fakeSerializedMethod1 asAnalysisMethod.

	self assert: method literals size equals: 0.
	self
		assert: method sourceCode
		equals: self exampleMethodBody1
]
