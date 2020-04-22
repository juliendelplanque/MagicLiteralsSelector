Class {
	#name : #MLSUnserializeToAnalysisLiteralTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSUnserializeToAnalysisLiteralTest >> testAsAnalysisLiteralCannotDecide [
	| literal serialized method |
	serialized := MLSSerializedLiteralCandidate new 
		startPosition: 17 ;
		endPosition: 17 ;
		status: MLSCannotDecide new ;
		yourself.
	method := Mock new.
	method stub sourceCode willReturn: 'unknownMethod
	^1'.
	literal	 := serialized asAnalysisLiteralInMethod: method.

	self assert: literal class equals: MLSAnalysisLiteral .
	self assert: literal value equals: '1'.
	self assert: literal isCannotDecide.
]

{ #category : #tests }
MLSUnserializeToAnalysisLiteralTest >> testAsAnalysisLiteralUnknown [
	| literal serialized method |
	serialized := MLSSerializedLiteralCandidate new 
		startPosition: 17 ;
		endPosition: 17 ;
		status: MLSIsMagic new ;
		yourself.
	method := Mock new.
	method stub sourceCode willReturn: 'unknownMethod
	^1'.
	literal	 := serialized asAnalysisLiteralInMethod: method.

	self assert: literal class equals: MLSAnalysisLiteral .
	self assert: literal value equals: '1'.
	self assert: literal isMagic.
	self assert: literal method equals: method
]
