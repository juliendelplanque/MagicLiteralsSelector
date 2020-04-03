"
A MLSMethodTest is a test class for testing the behavior of MLSMethod
"
Class {
	#name : #MLSMethodTest,
	#superclass : #MLSAbstractTest,
	#instVars : [
		'method'
	],
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #running }
MLSMethodTest >> setUp [ 
	method := self mlsMethodFor: #manyLiterals.
]

{ #category : #test }
MLSMethodTest >> testIsCompleted [
	self deny: method isCompleted.
	
	method literalCandidates first beMagic.
	
	self deny: method isCompleted.
	
	method literalCandidates do: [ :candidate |
		candidate beMagic ].
	
	self assert: method isCompleted.
]

{ #category : #test }
MLSMethodTest >> testLiteralsCandidates [

	self assert: method literalCandidates size equals: 5.
	self
		assertCollection: (method literalCandidates collect: #literalValue)
		includesAll: {42 . 1 . $a . 'A string' . #one}.
	self
		assertCollection: (method literalCandidates collect: [:c | c literalValue storeString])
		includesAll: {'42' . '1' . '$a' . '''A string''' . '#one'}.
	self
		assert: (method literalCandidates allSatisfy: [ :l | l status isUnknown ])
]

{ #category : #test }
MLSMethodTest >> testMethodClass [
	self assert: method methodClass equals: MLSAbstractTest
]

{ #category : #test }
MLSMethodTest >> testSourceCode [

	self assert: method sourceCode equals: (MLSAbstractTest >> #manyLiterals) sourceCode
]

{ #category : #test }
MLSMethodTest >> testWhenAnyLiteralCandidateStatusChangedDo [
	| changedLiteral |
	changedLiteral := nil.
	method whenAnyLiteralCandidateStatusChangedDo: [ :m :literal | changedLiteral := literal ].
	
	self assert: changedLiteral isNil.
	
	method literalCandidates first beMagic.
	
	self assert: changedLiteral equals: method literalCandidates first
]
