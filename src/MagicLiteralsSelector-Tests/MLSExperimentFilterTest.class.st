Class {
	#name : #MLSExperimentFilterTest,
	#superclass : #MLSAbstractTest,
	#category : #'MagicLiteralsSelector-Tests'
}

{ #category : #tests }
MLSExperimentFilterTest >> testHasLiteralFilter [
	| filter |
	filter := MLSExperimentFilterWithLiteral new.

	self assert: (filter accept: (self methodFor: #oneLiteralBooleanInReturn)).
	self assert: (filter accept: (self methodFor: #twoLiteralsNumberInExpression)).
	self assert: (filter accept: (self methodFor: #literalsInCurlyBraceArray)).
	self deny: (filter accept: (self methodFor: #noLiterals)).
]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterEmpty [
	| filter |
	filter := MLSExperimentFilterLiteralKind new.

	self assert: (filter accept: (self methodFor: #oneLiteralBooleanInReturn)).
	self deny: (filter accept: (self methodFor: #noLiterals)).

]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterOneKindCharcater [
	| filter |
	filter := MLSExperimentFilterLiteralKind new
		literalKinds: #( isCharacterLiteral ).

	self assert: (filter accept: (self methodFor: #oneLiteralBooleanInReturn)).
	self assert: (filter accept: (self methodFor: #manyLiterals )).
	self deny: (filter accept: (self methodFor: #oneLiteralCharInReturn)).

]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterOneKindInteger [
	| filter |
	filter := MLSExperimentFilterLiteralKind new
		literalKinds: #( isIntegerLiteral ).

	self assert: (filter accept: (self methodFor: #oneLiteralBooleanInReturn)).
	self assert: (filter accept: (self methodFor: #manyLiterals )).
	self deny: (filter accept: (self methodFor: #oneLiteralNumberInReturn)).

]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterSeveralKinds [
	| filter |
	filter := MLSExperimentFilterLiteralKind new
		literalKinds: #( isSymbolLiteral  isIntegerLiteral isStringLiteral ).

	self assert: (filter accept: (self methodFor: #oneLiteralBooleanInReturn)).
	self deny: (filter accept: (self methodFor: #oneLiteralNumberInReturn)).
	self assert: (filter accept: (self methodFor: #literalsInCurlyBraceArray)).
	self assert: (filter accept: (self methodFor: #manyLiterals)).

	filter literalKinds: #( isSymbolLiteral  isIntegerLiteral isStringLiteral isCharacterLiteral).
	self assert: (filter accept: (self methodFor: #literalsInCurlyBraceArray)). "because {1.$a.2} is ONE literal"
	self deny: (filter accept: (self methodFor: #manyLiterals)).
]
