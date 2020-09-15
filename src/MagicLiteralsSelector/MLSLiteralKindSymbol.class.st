Class {
	#name : #MLSLiteralKindSymbol,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindSymbol class >> tester [
	^#isSymbol
]

{ #category : #converting }
MLSLiteralKindSymbol >> asString [
	^'symbol'
]
