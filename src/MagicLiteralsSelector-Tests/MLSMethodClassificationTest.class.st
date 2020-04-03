"
This class contains tests on the classification APPI of MLSMethod (hasIntegerLiteral, ...)
"
Class {
	#name : #MLSMethodClassificationTest,
	#superclass : #MLSAbstractTest,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSMethodClassificationTest >> testHasBooleanLiteral [
	self deny: (self mlsMethodFor: #manyLiterals) hasBooleanLiteral.
	self deny: (self mlsMethodFor: #noLiterals) hasBooleanLiteral.
	self assert: (self mlsMethodFor: #oneLiteralBooleanInReturn) hasBooleanLiteral.
	self deny: (self mlsMethodFor: #oneLiteralStringInReturn) hasBooleanLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasCharacterLiteral [
	self assert: (self mlsMethodFor: #manyLiterals) hasCharacterLiteral.
	self deny: (self mlsMethodFor: #noLiterals) hasCharacterLiteral.
	self deny: (self mlsMethodFor: #oneLiteralNumberInReturn) hasCharacterLiteral.
	self assert: (self mlsMethodFor: #oneLiteralCharInReturn) hasCharacterLiteral.
	self assert: (self mlsMethodFor: #twoLiteralsInArgument) hasCharacterLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasFloatLiteral [
	self deny: (self mlsMethodFor: #manyLiterals) hasFloatLiteral.
	self deny: (self mlsMethodFor: #noLiterals) hasFloatLiteral.
	self deny: (self mlsMethodFor: #oneLiteralNumberInReturn) hasFloatLiteral.
	self assert: (self mlsMethodFor: #twoLiteralsNumberInExpression) hasFloatLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasIntegerLiteral [
	self assert: (self mlsMethodFor: #manyLiterals) hasIntegerLiteral.
	self deny: (self mlsMethodFor: #noLiterals) hasIntegerLiteral.
	self assert: (self mlsMethodFor: #oneLiteralNumberInReturn) hasIntegerLiteral.
	self deny: (self mlsMethodFor: #oneLiteralStringInReturn) hasIntegerLiteral.
	self assert: (self mlsMethodFor: #twoLiteralsInArgument) hasIntegerLiteral.
	self deny: (self mlsMethodFor: #twoLiteralsNumberInExpression) hasIntegerLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasNilLiteral [
	self deny: (self mlsMethodFor: #manyLiterals) hasNilLiteral.
	self deny: (self mlsMethodFor: #noLiterals) hasNilLiteral.
	self deny: (self mlsMethodFor: #oneLiteralStringInReturn) hasNilLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasStringLiteral [
	self assert: (self mlsMethodFor: #manyLiterals) hasStringLiteral.
	self deny: (self mlsMethodFor: #noLiterals) hasStringLiteral.
	self deny: (self mlsMethodFor: #oneLiteralNumberInReturn) hasStringLiteral.
	self assert: (self mlsMethodFor: #oneLiteralStringInReturn) hasStringLiteral.

]
