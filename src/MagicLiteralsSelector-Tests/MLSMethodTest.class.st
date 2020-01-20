"
A MLSMethodTest is a test class for testing the behavior of MLSMethod
"
Class {
	#name : #MLSMethodTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #'sample methods' }
MLSMethodTest >> sampleMethodWithLiterals [
	|x y |
	x := 42.
	y := x + 1.
	^ { x . y . $a }
]

{ #category : #test }
MLSMethodTest >> testLiteralsCandidates [
	| method |
	method := MLSMethod compiledMethod: self class >> #sampleMethodWithLiterals.
	
	self assert: method literalsCandidates size equals: 3.
	self assertCollection: (method literalsCandidates collect: #literalValue) includesAll: { 42 . 1 . $a }.
	self assert: (method literalsCandidates allSatisfy: [ :l | l status isUnknown ])
]

{ #category : #test }
MLSMethodTest >> testSourceCode [
	| method |
	method := MLSMethod compiledMethod: self class >> #sampleMethodWithLiterals.
	self assert: method sourceCode equals: (self class >> #sampleMethodWithLiterals) sourceCode
]
