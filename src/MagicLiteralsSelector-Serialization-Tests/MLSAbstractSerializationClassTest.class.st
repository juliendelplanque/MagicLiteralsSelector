Class {
	#name : #MLSAbstractSerializationClassTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

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
