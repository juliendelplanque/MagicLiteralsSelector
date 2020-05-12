Class {
	#name : #MLSLiteralKindArray,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindArray class >> tester [
	^#isArray
]

{ #category : #converting }
MLSLiteralKindArray >> asString [
	^'array'
]
