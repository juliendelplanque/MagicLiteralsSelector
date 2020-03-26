"
Some methods to test Magic Literals stuff
"
Class {
	#name : #MLSFakeClassForTesting,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #'example methods' }
MLSFakeClassForTesting >> curlyBraceArrayWithMixedLiteralAndNot [
	^ {1 . 4/2 . 6-3}
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> literalsInCurlyBraceArray [
	^ {1 . $a . 2}
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> manyLiterals [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> noLiterals [
	^ Object methods size
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> oneLiteralArrayInReturn [
	^ #(1 $a 2)
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> oneLiteralBooleanInReturn [
	^ true
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> oneLiteralCharInReturn [
	^ $a
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> oneLiteralNumberInReturn [
	^ 10
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> oneLiteralStringInReturn [
	^ 'returned value'
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> twoLiteralsInArgument [
	^ String new indexOf: $a startingAt: 5
]

{ #category : #'example methods' }
MLSFakeClassForTesting >> twoLiteralsNumberInExpression [
	^ 10.0 * 10.0
]
