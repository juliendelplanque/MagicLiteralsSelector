Class {
	#name : #MLSLiteralKindNil,
	#superclass : #MLSLiteralKind,
	#category : #'MagicLiteralsSelector-core'
}

{ #category : #'instance creation' }
MLSLiteralKindNil class >> tester [
	^#isNil
]

{ #category : #converting }
MLSLiteralKindNil >> asString [
	^'nil'
]
