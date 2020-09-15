Class {
	#name : #MLSLiteralKindFloat,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindFloat class >> tester [
	^#isFloat
]

{ #category : #converting }
MLSLiteralKindFloat >> asString [
	^'float'
]
