"
Some methods to test Magic Literals stuff
"
Class {
	#name : #MLSFakeClassForTesting,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #'sample methods' }
MLSFakeClassForTesting >> curlyBraceArrayWithMixedLiteralAndNot [
	^ {1 . 4/2 . 6-3}
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> literalsInCurlyBraceArray [
	^ {1 . $a . 2}
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> manyLiterals [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> noLiterals [
	^ Object methods size
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> oneLiteralArrayInReturn [
	^ #(1 $a 2)
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> oneLiteralBooleanInReturn [
	^ true
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> oneLiteralCharInReturn [
	^ $a
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> oneLiteralNumberInReturn [
	^ 10
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> oneLiteralStringInReturn [
	^ 'returned value'
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> twoLiteralsInArgument [
	^ String new indexOf: $a startingAt: 5
]

{ #category : #'sample methods' }
MLSFakeClassForTesting >> twoLiteralsNumberInExpression [
	^ 10.0 * 10.0
]
