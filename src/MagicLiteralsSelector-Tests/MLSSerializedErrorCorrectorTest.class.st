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
		setUpdateMethodBody ;
		correctMethod: method.
	self assert: method sourceCode equals: 'sampleMethodWithLiterals2
	^{ 1 . 2 . $a }'.
	
]
