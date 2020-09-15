Class {
	#name : #MLSLiteralKindTest,
	#superclass : #TestCase,
	#category : #'MagicLiteralsSelector-Tests-core'
}

{ #category : #accessing }
MLSLiteralKindTest >> detectLiteralKind: aValue [
	| lit |
	lit := Mock new.
	lit stub value willReturn: aValue.
	^MLSLiteralKind fromMLSLiteral: lit
]

{ #category : #accessing }
MLSLiteralKindTest >> testArrayKind [
	self assert: (self detectLiteralKind: #(a b c)) asString equals: 'array'.
	self assert: (self detectLiteralKind: {1 . 2 . 3}) asString equals: 'array'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testBooleanKind [
	self assert: (self detectLiteralKind: true) asString equals: 'boolean'.
	self assert: (self detectLiteralKind: false) asString equals: 'boolean'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testCharacterKind [
	self assert: (self detectLiteralKind: $a) asString equals: 'character'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testFloatKind [
	self assert: (self detectLiteralKind: 1.0) asString equals: 'float'
]

{ #category : #accessing }
MLSLiteralKindTest >> testIntegerKind [
	self assert: (self detectLiteralKind: 1) asString equals: 'integer'
]

{ #category : #accessing }
MLSLiteralKindTest >> testNilKind [
	self assert: (self detectLiteralKind: nil) asString equals: 'nil'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testStringKind [
	self assert: (self detectLiteralKind: 'a string') asString equals: 'string'.
	self deny: (self detectLiteralKind: #aSymbol) asString equals: 'string'.
]

{ #category : #accessing }
MLSLiteralKindTest >> testSymbolKind [
	self assert: (self detectLiteralKind: #aSymbol) asString equals: 'symbol'.
	self deny: (self detectLiteralKind: #aSymbol) asString equals: 'string'.
]
