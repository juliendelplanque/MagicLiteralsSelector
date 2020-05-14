Class {
	#name : #MLSSerializedErrorCorrectorTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

{ #category : #tests }
MLSSerializedErrorCorrectorTest >> testComputeCommentLength [
	"running on myself because I have comments in my body"
	| method |
	method := MLSSerializedMethod new
		methodPackageName: #'MagicLiteralsSelector-Tests' ;
		methodClassName: #MLSSerializedErrorCorrectorTest ;
		methodSelector: #testComputeCommentLength ;  "look this is me"
		sourceCode: 'fakeBodyWithouComment
	^nil' ;
		yourself.

	MLSSerializationErrorCorrector new
		correctMethod: method.
	self assert: method commentLength isNil.

	MLSSerializationErrorCorrector new
		setComputeCommentLength ;
		correctMethod: method.
	self assert: method commentLength equals: 83. "this is it"
	
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
