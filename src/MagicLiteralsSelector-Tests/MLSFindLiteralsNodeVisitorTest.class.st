"
A MLSFindLiteralsNodeVisitorTest is a test class for testing the behavior of MLSFindLiteralsNodeVisitor
"
Class {
	#name : #MLSFindLiteralsNodeVisitorTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #'private - utilities' }
MLSFindLiteralsNodeVisitorTest >> literalsFor: aMethod [
	^MLSFindLiteralsNodeVisitor visit: (MLSTestCases >> aMethod) parseTree
]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testCurlyBraceArrayWithMixedLiteralAndNot [
	self assert: (self literalsFor: #curlyBraceArrayWithMixedLiteralAndNot) size equals: 5

]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testLiteralsInCurlyBraceArray [
	self assert: (self literalsFor: #literalsInCurlyBraceArray) size equals: 1

]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testNoLiterals [
	self assert: (self literalsFor: #noLiterals) size equals: 0
]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testOneLiteralArrayInReturn [
	self assert: (self literalsFor: #oneLiteralArrayInReturn) size equals: 1

]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testOneLiteralInReturn [
	self assert: (self literalsFor: #oneLiteralCharInReturn) size equals: 1.
	self assert: (self literalsFor: #oneLiteralBooleanInReturn) size equals: 1.
	self assert: (self literalsFor: #oneLiteralNumberInReturn) size equals: 1.
	self assert: (self literalsFor: #oneLiteralStringInReturn) size equals: 1.

]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testTwoLiteralsInArgument [
	self assert: (self literalsFor: #twoLiteralsInArgument) size equals: 2

]

{ #category : #tests }
MLSFindLiteralsNodeVisitorTest >> testTwoLiteralsNumberInExpression [
	self assert: (self literalsFor: #twoLiteralsNumberInExpression) size equals: 2

]
