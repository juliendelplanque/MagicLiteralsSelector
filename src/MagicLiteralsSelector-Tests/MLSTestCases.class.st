"
Some methods to test Magic Literals stuff
"
Class {
	#name : #MLSTestCases,
	#superclass : #Object,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #'sample methods' }
MLSTestCases >> manyLiterals [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'sample methods' }
MLSTestCases >> noLiterals [
	^ Object methods size
]

{ #category : #'sample methods' }
MLSTestCases >> oneLiteralArrayInReturn [
	^ #(1 $a 2)
]

{ #category : #'sample methods' }
MLSTestCases >> oneLiteralBooleanInReturn [
	^ true
]

{ #category : #'sample methods' }
MLSTestCases >> oneLiteralCharInReturn [
	^ $a
]

{ #category : #'sample methods' }
MLSTestCases >> oneLiteralNumberInReturn [
	^ 10
]

{ #category : #'sample methods' }
MLSTestCases >> oneLiteralStringInReturn [
	^ 'returned value'
]

{ #category : #'sample methods' }
MLSTestCases >> twoLiteralsInArgument [
	^ String new indexOf: $a startingAt: 5
]

{ #category : #'sample methods' }
MLSTestCases >> twoLiteralsNumberInExpression [
	^ 10 * 10
]
