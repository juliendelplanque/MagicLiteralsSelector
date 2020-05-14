Class {
	#name : #MLSSerializedErrorCorrectorTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSSerializedErrorCorrectorTest >> testComputeCommentLength [
	| method |
	method := MLSSerializedMethod new
		methodPackageName: #'MagicLiteralsSelector-Tests' ;
		methodClassName: #MLSAbstractSerializationClassTest ;
		methodSelector: #sampleMethodWithLiterals2 ;
		sourceCode: 'fakeBodyWithComment
	"a comment"
	^nil' ;
		yourself.

	MLSSerializationErrorCorrector new
		correctMethod: method.
	self assert: method commentLength equals: 9.  "always computed"

	self deny: MLSSerializationErrorCorrector new doesAlterSomething.
	self assert: (MLSSerializationErrorCorrector new
		setComputeCommentLength ;
		doesAlterSomething).
	
]

{ #category : #tests }
MLSSerializedErrorCorrectorTest >> testCorrectMethodBody [
	| method |
	method := MLSSerializedMethod new
		methodPackageName: #'MagicLiteralsSelector-Tests' ;
		methodClassName: #MLSAbstractSerializationClassTest ;
		methodSelector: #sampleMethodWithLiterals2 ;
		sourceCode: 'wrong' ;
		yourself.

	MLSSerializationErrorCorrector new
		correctMethod: method.
	self deny: method sourceCode equals: 'sampleMethodWithLiterals2
	^{ 1 . 2 . $a }'.

	MLSSerializationErrorCorrector new
		setUpdateMethodBody ;
		correctMethod: method.
	self assert: method sourceCode equals: 'sampleMethodWithLiterals2
	^{ 1 . 2 . $a }'.
	
]

{ #category : #tests }
MLSSerializedErrorCorrectorTest >> testUpdateLiteralsKind [
	| method literal |
	literal := MLSSerializedLiteralCandidate new.
	method := MLSSerializedMethod new
		methodPackageName: #'MagicLiteralsSelector-Tests' ;
		methodClassName: #MLSAbstractSerializationClassTest ;
		methodSelector: #sampleMethodWithLiterals2 ;
		literalCandidates: { literal } ;
		yourself.

	MLSSerializationErrorCorrector new
		correctLiterals: method with: MLSAbstractSerializationClassTest>>#sampleMethodWithLiterals2.
	self assert: literal kind isNil.

	MLSSerializationErrorCorrector new
		setUpdateLiteralsKind ;
		correctLiterals: method with: MLSAbstractSerializationClassTest>>#sampleMethodWithLiterals2.
	self assert: literal kind class equals: MLSLiteralKindArray .
	
]
