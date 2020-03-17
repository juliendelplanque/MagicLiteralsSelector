Class {
	#name : #MLSFakeClassForTestingSerialization,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #'fake methods' }
MLSFakeClassForTestingSerialization >> sampleMethodWithLiterals1 [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'fake methods' }
MLSFakeClassForTestingSerialization >> sampleMethodWithLiterals2 [
	^{ 1 . 2 . $a }
]
