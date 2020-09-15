Class {
	#name : #MLSExperimentFilterTest,
	#superclass : #MLSAbstractTest,
	#category : #'MagicLiteralsSelector-Tests-core'
}

{ #category : #tests }
MLSExperimentFilterTest >> testHasLiteralFilter [
	| filter |
	filter := MLSExperimentFilterWithLiteral new.

	self assert: (filter accept: (self mlsMethodFor: #oneLiteralBooleanInReturn)).
	self assert: (filter accept: (self mlsMethodFor: #twoLiteralsNumberInExpression)).
	self assert: (filter accept: (self mlsMethodFor: #literalsInCurlyBraceArray)).
	self deny: (filter accept: (self mlsMethodFor: #noLiterals)).
]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterEmpty [
	| filter |
	filter := MLSExperimentFilterLiteralKind new.

	self assert: (filter accept: (self mlsMethodFor: #oneLiteralBooleanInReturn)).
	self deny: (filter accept: (self mlsMethodFor: #noLiterals)).

]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterOneKindCharcater [
	| filter |
	filter := MLSExperimentFilterLiteralKind new
		literalKinds: #( isCharacterLiteral ).

	self assert: (filter accept: (self mlsMethodFor: #oneLiteralBooleanInReturn)).
	self assert: (filter accept: (self mlsMethodFor: #manyLiterals )).
	self deny: (filter accept: (self mlsMethodFor: #oneLiteralCharInReturn)).

]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterOneKindInteger [
	| filter |
	filter := MLSExperimentFilterLiteralKind new
		literalKinds: #( isIntegerLiteral ).

	self assert: (filter accept: (self mlsMethodFor: #oneLiteralBooleanInReturn)).
	self assert: (filter accept: (self mlsMethodFor: #manyLiterals )).
	self deny: (filter accept: (self mlsMethodFor: #oneLiteralNumberInReturn)).

]

{ #category : #tests }
MLSExperimentFilterTest >> testLiteralKindFilterSeveralKinds [
	| filter |
	filter := MLSExperimentFilterLiteralKind new
		literalKinds: #( isSymbolLiteral  isIntegerLiteral isStringLiteral ).

	self assert: (filter accept: (self mlsMethodFor: #oneLiteralBooleanInReturn)).
	self deny: (filter accept: (self mlsMethodFor: #oneLiteralNumberInReturn)).
	self assert: (filter accept: (self mlsMethodFor: #literalsInCurlyBraceArray)).
	self assert: (filter accept: (self mlsMethodFor: #manyLiterals)).

	filter literalKinds: #( isSymbolLiteral  isIntegerLiteral isStringLiteral isCharacterLiteral).
	self assert: (filter accept: (self mlsMethodFor: #literalsInCurlyBraceArray)). "because {1.$a.2} is ONE literal"
	self deny: (filter accept: (self mlsMethodFor: #manyLiterals)).
]
