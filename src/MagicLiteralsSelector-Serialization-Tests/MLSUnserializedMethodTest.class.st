Class {
	#name : #MLSUnserializedMethodTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #tests }
MLSUnserializedMethodTest >> testAsMLSLiteralCandidateUnknown [
	| literal serialized body |
	body := 'unknownMethod
	^1'.
	serialized := MLSSerializedLiteralCandidate new 
		startPosition: 17 ;
		endPosition: 17 ;
		yourself.
	literal	 := serialized asMLSLiteralCandidateInSourceCode: body.

	self assert: literal class equals: MLSLiteralCandidateExternal .
	self assert: literal value equals: '1'.
]

{ #category : #tests }
MLSUnserializedMethodTest >> testAsMLSMethodInImage [
	| method serialized |
	serialized := (self mlsMethodFor: #sampleMethodWithLiterals2) asSerializedMethod.
	method	 := serialized asMLSMethod.

	self assert: method literalCandidates size equals: serialized literalCandidates size.
	self assert: method compiledMethod equals: MLSAbstractSerializationClassTest >> #sampleMethodWithLiterals2
]

{ #category : #tests }
MLSUnserializedMethodTest >> testAsMLSMethodUnknown [
	| method serialized body |
	body := 'unknownMethod
	"no comment"
	self noSourceCode'.
	serialized := MLSSerializedMethod new 
		methodPackageName: 'Unknown-Package' ;
		methodClassName: 'UnknownClass' ;
		methodSelector: 'unknownMethod' ;
		sourceCode: body ;
		literalCandidates: #() ;
		yourself.
	method	 := serialized asMLSMethod.

	self assert: method class equals: MLSMethodExternal .
	self assert: method sourceCode equals: body.
	self deny: method isTestMethod.
]
