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
	self deny: (self methodFor: #manyLiterals) hasBooleanLiteral.
	self deny: (self methodFor: #noLiterals) hasBooleanLiteral.
	self assert: (self methodFor: #oneLiteralBooleanInReturn) hasBooleanLiteral.
	self deny: (self methodFor: #oneLiteralStringInReturn) hasBooleanLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasCharacterLiteral [
	self assert: (self methodFor: #manyLiterals) hasCharacterLiteral.
	self deny: (self methodFor: #noLiterals) hasCharacterLiteral.
	self deny: (self methodFor: #oneLiteralNumberInReturn) hasCharacterLiteral.
	self assert: (self methodFor: #oneLiteralCharInReturn) hasCharacterLiteral.
	self assert: (self methodFor: #twoLiteralsInArgument) hasCharacterLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasFloatLiteral [
	self deny: (self methodFor: #manyLiterals) hasFloatLiteral.
	self deny: (self methodFor: #noLiterals) hasFloatLiteral.
	self deny: (self methodFor: #oneLiteralNumberInReturn) hasFloatLiteral.
	self assert: (self methodFor: #twoLiteralsNumberInExpression) hasFloatLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasIntegerLiteral [
	self assert: (self methodFor: #manyLiterals) hasIntegerLiteral.
	self deny: (self methodFor: #noLiterals) hasIntegerLiteral.
	self assert: (self methodFor: #oneLiteralNumberInReturn) hasIntegerLiteral.
	self deny: (self methodFor: #oneLiteralStringInReturn) hasIntegerLiteral.
	self assert: (self methodFor: #twoLiteralsInArgument) hasIntegerLiteral.
	self deny: (self methodFor: #twoLiteralsNumberInExpression) hasIntegerLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasNilLiteral [
	self deny: (self methodFor: #manyLiterals) hasNilLiteral.
	self deny: (self methodFor: #noLiterals) hasNilLiteral.
	self deny: (self methodFor: #oneLiteralStringInReturn) hasNilLiteral.

]

{ #category : #tests }
MLSMethodClassificationTest >> testHasStringLiteral [
	self assert: (self methodFor: #manyLiterals) hasStringLiteral.
	self deny: (self methodFor: #noLiterals) hasStringLiteral.
	self deny: (self methodFor: #oneLiteralNumberInReturn) hasStringLiteral.
	self assert: (self methodFor: #oneLiteralStringInReturn) hasStringLiteral.

]
