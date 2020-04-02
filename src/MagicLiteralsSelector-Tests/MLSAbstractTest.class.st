"
Abstract class containing helper methods to est MLS classes and offering some sample methods for the tests
"
Class {
	#name : #MLSAbstractTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #'example methods' }
MLSAbstractTest >> curlyBraceArrayWithMixedLiteralAndNot [
	^ {1 . 4/2 . 6-3}
]

{ #category : #'example methods' }
MLSAbstractTest >> literalsInCurlyBraceArray [
	^ {1 . $a . 2}
]

{ #category : #'example methods' }
MLSAbstractTest >> manyLiterals [
	|w x y z |
	w := #one.
	x := 42.
	y := x + 1.
	z := 'A string'.
	
	^ { x . y . $a }
]

{ #category : #'private - utilities' }
MLSAbstractTest >> methodFor: aSymbol [
	^MLSMethod compiledMethod: MLSAbstractTest >> aSymbol
]

{ #category : #'example methods' }
MLSAbstractTest >> noLiterals [
	^ Object methods size
]

{ #category : #'example methods' }
MLSAbstractTest >> oneLiteralArrayInReturn [
	^ #(1 $a 2)
]

{ #category : #'example methods' }
MLSAbstractTest >> oneLiteralBooleanInReturn [
	^ true
]

{ #category : #'example methods' }
MLSAbstractTest >> oneLiteralCharInReturn [
	^ $a
]

{ #category : #'example methods' }
MLSAbstractTest >> oneLiteralNumberInReturn [
	^ 10
]

{ #category : #'example methods' }
MLSAbstractTest >> oneLiteralStringInReturn [
	^ 'returned value'
]

{ #category : #'example methods' }
MLSAbstractTest >> twoLiteralsInArgument [
	^ String new indexOf: $a startingAt: 5
]

{ #category : #'example methods' }
MLSAbstractTest >> twoLiteralsNumberInExpression [
	^ 10.0 * 10.0
]
