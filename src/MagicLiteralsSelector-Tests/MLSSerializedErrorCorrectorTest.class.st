Class {
	#name : #MLSSerializedErrorCorrectorTest,
	#superclass : #MLSAbstractSerializationClassTest,
	#category : #'MagicLiteralsSelector-Tests-serialization'
}

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
		updateMethodBody ;
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
		updateLiteralsKind ;
		correctLiterals: method with: MLSAbstractSerializationClassTest>>#sampleMethodWithLiterals2.
	self assert: literal kind class equals: MLSLiteralKindArray .
	
]
