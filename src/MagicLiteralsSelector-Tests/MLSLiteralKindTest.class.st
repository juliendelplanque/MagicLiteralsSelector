Class {
	#name : #MLSLiteralKindTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests-core'
}

{ #category : #accessing }
MLSLiteralKindTest >> literalKind: aValue [
	| lit |
	lit := Mock new.
	lit stub value willReturn: aValue.
	^MLSLiteralKind fromMLSLiteral: lit
]

{ #category : #accessing }
MLSLiteralKindTest >> testArrayKind [
	self assert: (self literalKind: #(a b c)) asString equals: 'array'.
	self assert: (self literalKind: {1 . 2 . 3}) asString equals: 'array'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testBooleanKind [
	self assert: (self literalKind: true) asString equals: 'boolean'.
	self assert: (self literalKind: false) asString equals: 'boolean'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testCharacterKind [
	self assert: (self literalKind: $a) asString equals: 'character'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testFloatKind [
	self assert: (self literalKind: 1.0) asString equals: 'float'
]

{ #category : #accessing }
MLSLiteralKindTest >> testIntegerKind [
	self assert: (self literalKind: 1) asString equals: 'integer'
]

{ #category : #accessing }
MLSLiteralKindTest >> testNilKind [
	self assert: (self literalKind: nil) asString equals: 'nil'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testStringKind [
	self assert: (self literalKind: 'a string') asString equals: 'string'.
	self deny: (self literalKind: #aSymbol) asString equals: 'string'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testSymbolKind [
	self assert: (self literalKind: #aSymbol) asString equals: 'symbol'.
	self deny: (self literalKind: #aSymbol) asString equals: 'string'.
]
