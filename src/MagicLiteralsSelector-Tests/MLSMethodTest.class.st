"
A MLSMethodTest is a test class for testing the behavior of MLSMethod
"
Class {
	#name : #MLSMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'method'
	],
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #running }
MLSMethodTest >> setUp [ 
	method := MLSMethod compiledMethod: MLSFakeClassForTesting >> #manyLiterals.
]

{ #category : #test }
MLSMethodTest >> testIsCompleted [
	self deny: method isCompleted.
	
	method literalsCandidates first beMagic.
	
	self deny: method isCompleted.
	
	method literalsCandidates do: [ :candidate |
		candidate beMagic ].
	
	self assert: method isCompleted.
]

{ #category : #test }
MLSMethodTest >> testLiteralsCandidates [

	self assert: method literalsCandidates size equals: 5.
	self
		assertCollection: (method literalsCandidates collect: #literalValue)
		includesAll: {42 . 1 . $a . 'A string' . #one}.
	self
		assertCollection: (method literalsCandidates collect: [:c | c literalValue storeString])
		includesAll: {'42' . '1' . '$a' . '''A string''' . '#one'}.
	self
		assert: (method literalsCandidates allSatisfy: [ :l | l status isUnknown ])
]

{ #category : #test }
MLSMethodTest >> testMethodClass [
	self assert: method methodClass equals: MLSFakeClassForTesting
]

{ #category : #test }
MLSMethodTest >> testSourceCode [

	self assert: method sourceCode equals: (MLSFakeClassForTesting >> #manyLiterals) sourceCode
]

{ #category : #test }
MLSMethodTest >> testWhenAnyLiteralCandidateStatusChangedDo [
	| changedLiteral |
	changedLiteral := nil.
	method whenAnyLiteralCandidateStatusChangedDo: [ :m :literal | changedLiteral := literal ].
	
	self assert: changedLiteral isNil.
	
	method literalsCandidates first beMagic.
	
	self assert: changedLiteral equals: method literalsCandidates first
]
