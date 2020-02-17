Class {
	#name : #MLSFakeClassForTestingPurpose,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-Serialization-Tests-Core'
}

{ #category : #'fake methods' }
MLSFakeClassForTestingPurpose >> sampleMethodWithLiterals1 [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'fake methods' }
MLSFakeClassForTestingPurpose >> sampleMethodWithLiterals2 [
	^{ 1 . 2 . $a }
]
