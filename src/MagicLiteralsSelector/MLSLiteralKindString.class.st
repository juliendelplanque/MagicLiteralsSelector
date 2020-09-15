Class {
	#name : #MLSLiteralKindString,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindString class >> tester [
	^[:val | val isString and: [ val isSymbol not ] ]
]

{ #category : #converting }
MLSLiteralKindString >> asString [
	^'string'
]
