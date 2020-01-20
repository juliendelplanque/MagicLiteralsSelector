"
A MLSMethodTest is a test class for testing the behavior of MLSMethod
"
Class {
	#name : #MLSMethodTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #test }
MLSMethodTest >> testLiteralsCandidates [
	| method |
	method := self sampleMethodWithLiterals.
	
	self assert: method literalsCandidates size equals: 3
]
