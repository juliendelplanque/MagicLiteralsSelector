Class {
	#name : #MLSAbstractSerializationClassTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #'example methods' }
MLSAbstractSerializationClassTest >> exampleMethodBody1 [
	^'unknownMethod
	"no comment"
	self noSourceCode'
]

{ #category : #'example methods' }
MLSAbstractSerializationClassTest >> exampleMethodBody2 [
	^'unknownMethod
	^1'
]

{ #category : #'private - utilities' }
MLSAbstractSerializationClassTest >> fakeSerializedLiteral [
	| literalPos |
	literalPos := self exampleMethodBody2 indexOf: $1.
	^MLSSerializedLiteralCandidate new 
		startPosition: literalPos ;
		endPosition: literalPos ;
		status: MLSIsMagic new ;
		yourself.
]

{ #category : #'private - utilities' }
MLSAbstractSerializationClassTest >> fakeSerializedMethod1 [
	^MLSSerializedMethod new 
		methodPackageName: 'Unknown-Package' ;
		methodClassName: 'UnknownClass' ;
		methodSelector: 'unknownMethod' ;
		sourceCode: self exampleMethodBody1 ;
		literalCandidates: #() ;
		yourself.
]

{ #category : #'private - utilities' }
MLSAbstractSerializationClassTest >> fakeSerializedMethod2 [
	^MLSSerializedMethod new 
		methodPackageName: 'Unknown-Package' ;
		methodClassName: 'UnknownClass' ;
		methodSelector: 'unknownMethod' ;
		sourceCode: self exampleMethodBody2 ;
		literalCandidates: {  self fakeSerializedLiteral } ;
		yourself.
]

{ #category : #'private - utilities' }
MLSAbstractSerializationClassTest >> mlsMethodFor: aSymbol [
	^MLSMethod compiledMethod: MLSAbstractSerializationClassTest >> aSymbol
]

{ #category : #'example methods' }
MLSAbstractSerializationClassTest >> sampleMethodWithLiterals1 [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'example methods' }
MLSAbstractSerializationClassTest >> sampleMethodWithLiterals2 [
	^{ 1 . 2 . $a }
]
